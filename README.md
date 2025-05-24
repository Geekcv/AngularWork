import {
  Component,
  EventEmitter,
  Input,
  Output,
  ChangeDetectorRef,
  AfterViewInit,
  ElementRef,
  ViewChild,
  OnInit,
} from '@angular/core';

interface FormElementOption {
  title: string;
  value: string;
  co?: string; // for states (country id)
  st?: string; // for cities (state id)
}

interface FormElement {
  id: string;
  type: string;
  label: string;
  required: boolean;
  options: FormElementOption[];
}

@Component({
  selector: 'app-form-builder',
  templateUrl: './form-builder.component.html',
  styleUrls: ['./form-builder.component.css'],
})
export class FormBuilderComponent implements AfterViewInit, OnInit {
  @Input() forms: any;
  @Input() formdata: any;
  @Output() formdataChange = new EventEmitter<any>();
  @Output() formChange = new EventEmitter<any>();
  @Output() formValidityChange = new EventEmitter<boolean>();

  @ViewChild('inputField') inputField: ElementRef | undefined;

  searchValues: { [key: string]: string } = {};
  filteredOptions: { [key: string]: any[] } = {};
  showDropdown: { [key: string]: boolean } = {};
  focusedIndex: { [key: string]: number } = {};

  constructor(private cdr: ChangeDetectorRef) {}

  ngOnInit() {
    this.forms.elements.forEach((element: any) => {
      if (element.type === 'select-list') {
        this.searchValues[element.id] = '';
        this.filteredOptions[element.id] = element.options;

        if (element.id === 'city' && this.formdata['state']) {
          this.updateCityOptions(this.formdata['state']);
        }
      }
    });
  }

  ngAfterViewInit() {
    if (this.inputField) {
      this.inputField.nativeElement.focus();
    }
  }

  allowOnlyDigits(event: KeyboardEvent): void {
    const allowedKeys = ['Backspace', 'ArrowLeft', 'ArrowRight', 'Tab'];
    if (!/^\d$/.test(event.key) && !allowedKeys.includes(event.key)) {
      event.preventDefault();
    }
  }

  onPhoneInput(event: any, id: string): void {
    let value = event.target.value.replace(/\D/g, '');
    if (value.length > 10) {
      value = value.slice(0, 10);
    }
    this.formdata[id] = value;
  }

  onAlphaNumericInput(event: any, id: string): void {
    let value = event.target.value.replace(/[^a-zA-Z0-9]/g, '');
    if (value.length > 12) {
      value = value.slice(0, 12);
    }
    this.formdata[id] = value;
  }

  filterOptions(id: string, options: any[]) {
    const rawInput = this.searchValues[id] || '';
    const searchTerm = rawInput.trim().toLowerCase();

    this.showDropdown[id] = true;

    if (id === 'state' && this.formdata['country']) {
      const filteredStates = options.filter(
        (state: any) => state.co === this.formdata['country']
      );
      this.filteredOptions['state'] = searchTerm
        ? filteredStates.filter((s: any) =>
            s.title.toLowerCase().includes(searchTerm)
          )
        : filteredStates;
    } else if (id === 'city' && this.formdata['state']) {
      const filteredCities = options.filter(
        (city: any) => city.st === this.formdata['state']
      );
      this.filteredOptions['city'] = searchTerm
        ? filteredCities.filter((c: any) =>
            c.title.toLowerCase().includes(searchTerm)
          )
        : filteredCities;
    } else {
      this.filteredOptions[id] = searchTerm
        ? options.filter((opt: any) =>
            opt.title.toLowerCase().includes(searchTerm)
          )
        : options;
    }

    this.focusedIndex[id] = 0;
  }

  selectOption(id: string, option: any) {
    this.formdata[id] = option.value;
    this.searchValues[id] = option.title;
    this.showDropdown[id] = false;

    if (id === 'country') {
      this.updateStateOptions(option.value); // filter relevant states
      this.formdata['state'] = null;
      this.searchValues['state'] = '';
      this.filteredOptions['city'] = [];
      this.formdata['city'] = null;
      this.searchValues['city'] = '';
    }

    if (id === 'state') {
      this.updateCityOptions(option.value); // filter relevant cities
      this.formdata['city'] = null;
      this.searchValues['city'] = '';
    }
  }

  updateStateOptions(selectedCountryId: string) {
    const stateElement = this.forms.elements.find((e: any) => e.id === 'state');
    if (!stateElement) return;

    this.filteredOptions['state'] = stateElement.options.filter(
      (state: any) => state.co === selectedCountryId
    );
  }

  updateCityOptions(selectedStateId: string) {
    const cityElement = this.forms.elements.find((e: any) => e.id === 'city');
    if (!cityElement) return;

    this.filteredOptions['city'] = cityElement.options.filter(
      (city: any) => city.st === selectedStateId
    );
  }

  handleKeydown(event: KeyboardEvent, id: string) {
    const options = this.filteredOptions[id] || [];
    const maxIndex = options.length - 1;

    if (event.key === 'ArrowDown') {
      event.preventDefault();
      this.focusedIndex[id] = Math.min(this.focusedIndex[id] + 1, maxIndex);
      this.selectOption(id, options[this.focusedIndex[id]]);
    } else if (event.key === 'ArrowUp') {
      event.preventDefault();
      this.focusedIndex[id] = Math.max(this.focusedIndex[id] - 1, 0);
      this.selectOption(id, options[this.focusedIndex[id]]);
    } else if (event.key === 'Enter') {
      event.preventDefault();
    }
  }

  hideDropdownWithDelay(id: string) {
    setTimeout(() => {
      this.showDropdown[id] = false;
    }, 150);
  }
}

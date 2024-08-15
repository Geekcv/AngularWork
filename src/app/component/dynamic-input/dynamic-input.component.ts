import { Component,Input } from '@angular/core';
import { FormGroup } from '@angular/forms';

@Component({
  selector: 'app-dynamic-input',
  templateUrl: './dynamic-input.component.html',
  styleUrl: './dynamic-input.component.css'
})
export class DynamicInputComponent {
  @Input() title!: string;
  @Input() type!: string;

  @Input() form!: FormGroup;
  @Input() controlName!: string;

  // This will hold the value of the input
  value: any;
}

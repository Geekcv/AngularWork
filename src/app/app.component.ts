import { Component } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  form!: FormGroup;

  fields = [
    { title: 'username', type: 'text', validators: [Validators.required, Validators.minLength(3)] },
    { title: 'password', type: 'password', validators: [Validators.required, Validators.minLength(6)] },
  ];

  ngOnInit() {
    const formGroup: { [key: string]: FormControl } = {};
    this.fields.forEach(field => {
      formGroup[field.title] = new FormControl('', field.validators);
    });
    this.form = new FormGroup(formGroup);
  }

  onSubmit() {
    if (this.form.valid) {
      console.log('Form Submitted', this.form.value);
    } else {
      console.log('Form is invalid');
    }
  }

  
}

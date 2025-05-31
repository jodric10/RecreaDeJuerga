import { Component, EventEmitter, Input, Output, ViewEncapsulation } from '@angular/core';
import { FormGroup, ReactiveFormsModule } from '@angular/forms';
import { CamposForm } from '../../models/CamposForm';

@Component({
  selector: 'app-form-sign-up',
  imports: [ReactiveFormsModule],
  templateUrl: './form-sign-up.component.html',
  styleUrl: './form-sign-up.component.css',
})
export class FormSignUpComponent {
    @Input() formGroup!:FormGroup;
    @Input() fields!: CamposForm[];
    @Input() submitLabel = 'Sign Up';
    @Input() errorMensage: String|null=null;
    @Output() sign_upEvent= new EventEmitter<FormGroup>();

    submit(){
      this.sign_upEvent.emit(this.formGroup);
    }
}

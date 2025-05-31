import { Component, EventEmitter, Input, Output, ViewEncapsulation } from '@angular/core';
import { FormGroup, ReactiveFormsModule } from '@angular/forms';
import { CamposForm } from '../../models/CamposForm';

@Component({
  selector: 'app-form-sign-in',
  imports: [ReactiveFormsModule],
  templateUrl: './form-sign-in.component.html',
  styleUrl: './form-sign-in.component.css',
})
export class FormSignInComponent {
    @Input() formGroup!:FormGroup;
    @Input() fields!: CamposForm[];
    @Input() submitLabel = 'Sign In';
    @Input() errorMensage: String|null=null;
    @Output() sign_inEvent= new EventEmitter<FormGroup>();

    submit(){
      this.sign_inEvent.emit(this.formGroup);
    }}

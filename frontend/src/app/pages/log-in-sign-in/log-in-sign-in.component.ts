import { CommonModule, NgClass } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { CamposForm } from '../../models/CamposForm';
import { FormSignInComponent } from '../../components/form-sign-in/form-sign-in.component';
import { FormSignUpComponent } from '../../components/form-sign-up/form-sign-up.component';
import { HttpErrorResponse } from '@angular/common/http';
import { LoginRequest } from '../../models/Auth/LoginRequest';
import { RegisterRequest } from '../../models/Auth/RegisterRequest';
import { Router } from '@angular/router';
import { AuthService } from '../../services/auth/auth.service';
import { ToastService } from '../../services/toastMessage/toast.service';

@Component({
  selector: 'app-log-in-sign-in',
  standalone: true,
  imports: [CommonModule, FormSignInComponent, FormSignUpComponent],
  templateUrl: './log-in-sign-in.component.html',
  styleUrl: './log-in-sign-in.component.css',
})
export class LogInSignInComponent implements OnInit {
  SignIn!: FormGroup;
  SignUp!: FormGroup;
  sign_in: boolean = true;
  Fields_signIn: CamposForm[] = [
    {
      name: 'username',
      type: 'string',
      placeholder: 'Username',
      validators: [Validators.required],
    },
    {
      name: 'password',
      type: 'password',
      placeholder: 'Password',
      validators: [Validators.required, Validators.minLength(6)],
    },
  ];
  Fields_signUp: CamposForm[] = [
    {
      name: 'username',
      type: 'text',
      placeholder: 'Username',
      validators: [Validators.required],
    },
    {
      name: 'email',
      type: 'email',
      placeholder: 'Email',
      validators: [Validators.required, Validators.email],
    },
    {
      name: 'password',
      type: 'password',
      placeholder: 'Password',
      validators: [Validators.required, Validators.minLength(6)],
    },
  ];
  errorMessageSignIn: string | null = null;
  errorMessageSignUp: string | null = null;

  constructor(
    private router: Router,
    private authService: AuthService,
    private toastService: ToastService
  ) {}

  ngOnInit(): void {
    this.SignIn = new FormGroup({});
    this.Fields_signIn.forEach((field: CamposForm) => {
      this.SignIn.addControl(
        field.name,
        new FormControl('', field.validators || [])
      );
    });
    this.SignUp = new FormGroup({});
    this.Fields_signUp.forEach((field: CamposForm) => {
      this.SignUp.addControl(
        field.name,
        new FormControl('', field.validators || [])
      );
    });
  }

  cambiarFormulario() {
    this.sign_in = !this.sign_in;
  }

  onSubmitSignIn(SignIn: FormGroup) {
    const loginDto = SignIn.value as LoginRequest;

    this.authService.loginUser(loginDto).subscribe({
      next: () => {
        this.router.navigate(['/'], {
          state: {
            toast: {
              severity: 'success',
              summary: 'Inicio de sesión',
              detail: 'Has iniciado sesión correctamente.',
            },
          },
        });
      },
      error: (err: HttpErrorResponse) => {
        this.errorMessageSignIn = err.error?.detail;
        this.toastService.show({
          severity: 'error',
          summary: 'Error de inicio',
          detail: this.errorMessageSignIn || 'Ha ocurrido un error inesperado.',
        });
      },
    });
  }

 onSubmitSignUp(SignUp: FormGroup) {
  const registerDTO = SignUp.value as RegisterRequest;

  this.authService.registerUser(registerDTO).subscribe({
    next: () => {
      this.router.navigate(['/'], {
        state: {
          toast: {
            severity: 'success',
            summary: 'Registro exitoso',
            detail: 'Te has registrado correctamente.'
          }
        }
      });
    },
    error: (err: HttpErrorResponse) => {
      this.errorMessageSignUp = err.error?.detail;

      this.toastService.show({
        severity: 'error',
        summary: 'Error de registro',
        detail: this.errorMessageSignUp || 'No se pudo completar el registro.'
      });
    }
  });
}

}

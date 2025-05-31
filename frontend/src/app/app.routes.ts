import { Routes } from '@angular/router';
import { AuthGuard } from './helpers/guard/auth.guard';

export const routes: Routes = [
  {
    path: '',
    canActivate: [AuthGuard],
    loadComponent: () =>
      import('./app.component').then(
        (m) => m.AppComponent
      ),
  },
  {
    path: 'auth',
    loadComponent: () =>
      import('./pages/log-in-sign-in/log-in-sign-in.component').then(
        (m) => m.LogInSignInComponent
      ),
  },
];

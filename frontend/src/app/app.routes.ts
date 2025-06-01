import { Routes } from '@angular/router';
import { AuthGuard } from './helpers/guard/auth.guard';

export const routes: Routes = [
  {
    path: '',
    loadComponent: () =>
      import('./pages/layout/layout.component').then((m) => m.LayoutComponent),
    children: [
      {
        path: '',
        loadComponent: () =>
          import('./pages/home/home.component').then((m) => m.HomeComponent),
      },
    ],
  },
  {
    path: 'auth',
    loadComponent: () =>
      import('./pages/log-in-sign-in/log-in-sign-in.component').then(
        (m) => m.LogInSignInComponent
      ),
  },
];

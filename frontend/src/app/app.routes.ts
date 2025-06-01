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
      {
        path: 'jugadores',
        loadComponent: () =>
          import('./pages/jugadores/jugadores.component').then(
            (m) => m.JugadoresComponent
          ),
      },
      {
        path: 'partidos',
        loadComponent: () =>
          import('./pages/partidos/partidos.component').then(
            (m) => m.PartidosComponent
          ),
      },
      {
        path: 'clasificacion',
        loadComponent: () =>
          import('./pages/clasificacion/clasificacion.component').then(
            (m) => m.ClasificacionComponent
          ),
      },
      {
        path: 'admin',
        canActivate: [AuthGuard],
        loadComponent: () =>
          import('./pages/admin/admin.component').then((m) => m.AdminComponent),
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
  {
    path: '**',
    redirectTo: '',
    pathMatch: 'full',
  },
];

import { Routes } from '@angular/router';
import { AuthGuard } from './helpers/guard/auth.guard';

export const routes: Routes = [
  {
    path: '',
    loadComponent: () =>
      import('./pages/intro/intro.component').then((m) => m.IntroComponent),
  },
  {
    path: 'app',
    loadComponent: () =>
      import('./pages/layout/layout.component').then((m) => m.LayoutComponent),
    children: [
      {
        path: '',
        loadComponent: () =>
          import('./pages/home/home.component').then((m) => m.HomeComponent),
      },
      {
        path: ':nombreEquipo/jugadores',
        loadComponent: () =>
          import('./pages/jugadores/jugadores.component').then(
            (m) => m.JugadoresComponent
          ),
        children: [
          {
            path: '',
            redirectTo: '34fb45a0-93db-4fc8-b5fe-77cd67600cee',
            pathMatch: 'full',
          },
          {
            path: ':jugadorId',
            loadComponent: () =>
              import(
                './pages/detalles-jugador/detalles-jugador.component'
              ).then((m) => m.DetallesJugadorComponent),
          },
        ],
      },
      {
        path: ':nombreEquipo/partidos',
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
      {
        path: 'admin/:nombreEquipo/menu',
        loadComponent: () =>
          import('./pages/menu/menu.component').then((m) => m.MenuComponent),
      },
      {
        path: 'admin/:nombreEquipo/menu/jugadores',
        loadComponent: () =>
          import('./pages/jugadores-admin/jugadores-admin.component').then(
            (m) => m.JugadoresAdminComponent
          ),
      },
      {
        path: 'admin/:nombreEquipo/menu/jugadores/:jugadorId/parecidos',
        loadComponent: () =>
          import('./pages/parecidos-admin/parecidos-admin.component').then(
            (m) => m.ParecidosAdminComponent
          ),
      },
      {
        path: 'admin/:nombreEquipo/menu/clasificacion',
        loadComponent: () =>
          import(
            './pages/clasificacion-admin/clasificacion-admin.component'
          ).then((m) => m.ClasificacionAdminComponent),
      },
      {
        path: 'admin/:nombreEquipo/menu/partidos',
        loadComponent: () =>
          import('./pages/partidos-admin/partidos-admin.component').then(
            (m) => m.PartidosAdminComponent
          ),
      },
      {
        path: 'admin/:nombreEquipo/menu/partidos/:partidoId/estadisticas-jugadores',
        loadComponent: () =>
          import(
            './pages/estadisticas-jugadores-admin/estadisticas-jugadores-admin.component'
          ).then((m) => m.EstadisticasJugadoresAdminComponent),
      },
      {
        path: ':nombreEquipo/partidos/estadisticas/:partidoId',
        loadComponent: () =>
          import('./pages/estadisticas/estadisticas.component').then(
            (m) => m.EstadisticasComponent
          ),
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

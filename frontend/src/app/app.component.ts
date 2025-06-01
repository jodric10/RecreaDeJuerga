import { Component, OnInit } from '@angular/core';
import { NavigationEnd, Router, RouterOutlet } from '@angular/router';
import { ToastComponent } from './components/toast/toast.component';
import { ToastMessage } from './models/toastMessage/toastMessage';
import { ToastService } from './services/toastMessage/toast.service';
import { filter } from 'rxjs';
import { MenuComponent } from './components/menu/menu.component';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet, ToastComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
})
export class AppComponent {
  title = 'RecreaDeJuerga';
  constructor(private router: Router, private toastService: ToastService) {
    this.router.events
      .pipe(filter((event) => event instanceof NavigationEnd))
      .subscribe(() => {
        const toast = window.history.state.toast;
        if (toast) {
          this.toastService.show(toast);
        }
      });
  }
}

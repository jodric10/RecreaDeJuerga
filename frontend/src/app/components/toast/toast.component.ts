import { Component, OnInit } from '@angular/core';
import { ToastMessage } from '../../models/toastMessage/toastMessage';
import { ToastService } from '../../services/toastMessage/toast.service';

@Component({
  selector: 'app-toast',
  standalone: true,
  templateUrl: './toast.component.html',
  styleUrls: ['./toast.component.css'],
})
export class ToastComponent implements OnInit {
  toasts: ToastMessage[] = [];

  constructor(private toastService: ToastService) {}

  ngOnInit(): void {
    this.toastService.toast$.subscribe((toast) => {
      this.toasts.push(toast);
      setTimeout(() => this.removeToast(toast), 4000);
    });
  }

  removeToast(toast: ToastMessage) {
    toast.fadeOut = true;

    setTimeout(() => {
      this.toasts = this.toasts.filter((t) => t !== toast);
    }, 400);
  }
}

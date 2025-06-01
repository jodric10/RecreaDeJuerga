import { Injectable } from '@angular/core';
import { Subject } from 'rxjs';
import { ToastMessage } from '../../models/toastMessage/toastMessage';

@Injectable({
  providedIn: 'root',
})
export class ToastService {
  private toastSubject = new Subject<ToastMessage>();
  toast$ = this.toastSubject.asObservable();
  private currentId = 0;

  show(toast: Omit<ToastMessage, 'id'>) {
    this.toastSubject.next({
      ...toast,
      id: ++this.currentId,
    });
  }
}

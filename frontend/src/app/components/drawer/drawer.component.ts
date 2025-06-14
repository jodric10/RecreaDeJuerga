import { CommonModule } from '@angular/common';
import { Component, EventEmitter, HostListener, Input, Output } from '@angular/core';

@Component({
  selector: 'app-drawer',
  imports: [CommonModule],
  templateUrl: './drawer.component.html',
  styleUrl: './drawer.component.css',
})
export class DrawerComponent {
  @Input() side: 'left' | 'right' = 'right';
  @Input() width: string = '300px';
  @Output() cerrar = new EventEmitter<void>();

  @HostListener('document:keydown.escape')
  onEsc() {
    this.cerrarDrawer();
  }

  cerrarDrawer() {
    this.cerrar.emit();
  }
}

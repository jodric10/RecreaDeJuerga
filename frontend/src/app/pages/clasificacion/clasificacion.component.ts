import { Component, inject, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ClasificacionService } from '../../services/clasificacion/clasificacion.service';
import { ClasificacionDTO } from '../../models/clasificacion/clasificacion';
import { filter, take, tap } from 'rxjs';
import { ToastService } from '../../services/toastMessage/toast.service';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-clasificacion',
  imports: [CommonModule],
  templateUrl: './clasificacion.component.html',
  styleUrl: './clasificacion.component.css',
})
export class ClasificacionComponent implements OnInit {
  private route = inject(ActivatedRoute);
  private clasificacionService = inject(ClasificacionService);
  private toastService = inject(ToastService);

  clasificacion: ClasificacionDTO[] | undefined;
  sortKey: string = '';
  sortAsc: boolean = true;

  ngOnInit(): void {
    this.clasificacionService.getClasificacion();

    this.clasificacionService.clasificacion$
      .pipe(
        filter((clasificacion) => clasificacion.length > 0),
        take(1)
      )
      .subscribe((clasificacion) => {
        this.clasificacion = clasificacion;
      });
  }

  ordenarPor(key: keyof ClasificacionDTO) {
    if (key === 'equipo') return;

    if (this.sortKey === key) {
      this.sortAsc = !this.sortAsc;
    } else {
      this.sortKey = key;
      this.sortAsc = true;
    }

    this.clasificacion = [...(this.clasificacion || [])].sort((a, b) => {
      const valorA = a[key];
      const valorB = b[key];

      if (valorA! < valorB!) return this.sortAsc ? -1 : 1;
      if (valorA! > valorB!) return this.sortAsc ? 1 : -1;

      // Desempate por puntos
      if (a.puntos < b.puntos) return this.sortAsc ? -1 : 1;
      if (a.puntos > b.puntos) return this.sortAsc ? 1 : -1;

      return 0;
    });
  }
}

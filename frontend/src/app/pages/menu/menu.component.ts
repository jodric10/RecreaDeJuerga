import { Component, inject, OnInit } from '@angular/core';
import { EquipoDTO } from '../../models/equipo/equipo';
import { EquipoService } from '../../services/equipo/equipo.service';
import { filter, take, tap } from 'rxjs';
import { HttpErrorResponse } from '@angular/common/http';
import { ToastService } from '../../services/toastMessage/toast.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-menu',
  imports: [],
  templateUrl: './menu.component.html',
  styleUrl: './menu.component.css',
})
export class MenuComponent implements OnInit {
  equipo: EquipoDTO | null = null;
  private equipoService = inject(EquipoService);
  private toastService = inject(ToastService);
  private route = inject(ActivatedRoute);
  private router = inject(Router);

  ngOnInit(): void {
    this.equipoService.equipoSeleccionado$
      .pipe(
        take(1),
        tap((equipo: EquipoDTO | null) => {
          if (!equipo) {
            const nombreUrl = this.route.snapshot.paramMap.get('nombreEquipo');
            if (nombreUrl) {
              const nombreEquipo = nombreUrl.replace(/_/g, ' ');
              this.getEquipoPorNombre(nombreEquipo);
            }
          }
        }),
        filter(
          (equipo: EquipoDTO | null): equipo is EquipoDTO => equipo !== null
        )
      )
      .subscribe({
        next: (equipo: EquipoDTO) => {
          this.equipo = equipo;
        },
        error: (err: HttpErrorResponse) => {
          this.toastService.show({
            severity: 'error',
            summary: 'Error al obtener el equipo',
            detail: err.error?.detail || 'Error inesperado.',
          });
        },
      });
  }

  getEquipoPorNombre(nombre: string): void {
    this.equipoService.getEquipoPorNombre(nombre).subscribe({
      next: (equipo: EquipoDTO) => {
        this.equipo = equipo;
        this.equipoService.setEquipoSeleccionado(equipo);
      },
      error: (err: HttpErrorResponse) => {
        this.toastService.show({
          severity: 'error',
          summary: 'No se encontró el equipo',
          detail: err.error?.detail || 'Error inesperado.',
        });
      },
    });
  }

  volver() {
    this.router.navigate(['/app/admin']);
  }

  navegarA(opcion: string): void {
    this.router.navigate([opcion], { relativeTo: this.route });
  }
}

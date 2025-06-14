import { Component, inject, OnInit } from '@angular/core';
import { EquipoDTO } from '../../models/equipo/equipo';
import { EquipoService } from '../../services/equipo/equipo.service';
import { take } from 'rxjs';
import { EquipoSimpleDTO } from '../../models/equipo/equipoSimple';
import { HttpErrorResponse } from '@angular/common/http';
import { ToastService } from '../../services/toastMessage/toast.service';
import {
  FormControl,
  FormGroup,
  ReactiveFormsModule,
  Validators,
} from '@angular/forms';
import { EquipoFormularioDTO } from '../../models/equipo/equipoFormulario';
import { CommonModule } from '@angular/common';
import { DrawerComponent } from '../../components/drawer/drawer.component';
import { Router } from '@angular/router';

@Component({
  selector: 'app-admin',
  imports: [CommonModule, DrawerComponent, ReactiveFormsModule],
  templateUrl: './admin.component.html',
  styleUrl: './admin.component.css',
})
export class AdminComponent implements OnInit {
  equipos: EquipoDTO[] = [];
  private equipoService = inject(EquipoService);
  private toastService = inject(ToastService);
  private router = inject(Router);
  mostrarDrawer: boolean = false;
  formularioEquipo: FormGroup | null = null;
  editando: boolean= false;
  equipoId: string="";

  ngOnInit(): void {
    this.cargarEquipos();
    this.formularioEquipo = new FormGroup({
      nombre: new FormControl('', [Validators.required]),
      url_logo: new FormControl(''),
      eslogan: new FormControl(''),
      descripcion: new FormControl(''),
      url_equipo: new FormControl(''),
    });
  }

  resetearFormulario(): void {
    this.formularioEquipo?.reset();
  }

  equipoSeleccionado(equipo: EquipoDTO): void {
    this.equipoService.setEquipoSeleccionado(equipo);
    const nombreEquipoURL = equipo.nombre.replace(/ /g, '_');
    this.router.navigate(['/app', 'admin', nombreEquipoURL, 'menu']);
  }

  eliminarEquipo(equipo: EquipoDTO, event: MouseEvent): void {
    event.stopPropagation();
    this.equipoService.eliminarEquipo(equipo.id).subscribe({
      next: () => {
        this.toastService.show({
          severity: 'success',
          summary: 'Equipo eliminado',
          detail: `Se ha eliminado el equipo ${equipo.nombre} correctamente.`,
        });
        this.cargarEquipos();
      },
      error: (err: HttpErrorResponse) => {
        this.toastService.show({
          severity: 'error',
          summary: 'Error al eliminar el equipo',
          detail: err.error?.detail || 'Error inesperado.',
        });
      },
    });
  }

  editarEquipo(equipo: EquipoDTO, event: MouseEvent): void {
    event.stopPropagation();
    this.editando=true;
    this.equipoId=equipo.id;
    this.mostrarDrawer=true;
    this.formularioEquipo?.patchValue({
      nombre: equipo.nombre,
      url_logo: equipo.url_logo,
      eslogan: equipo.eslogan,
      descripcion: equipo.descripcion,
      url_equipo: equipo.url_equipo,
    });
  }

  onSubmit(): void {
  const datosEquipo: EquipoFormularioDTO = this.formularioEquipo?.value as EquipoFormularioDTO;

  if (this.editando && this.equipoId != null) {
    console.log(this.equipoId);
    this.equipoService.editarEquipo(this.equipoId, datosEquipo).subscribe({
      next: (equipo: EquipoDTO) => {
        this.toastService.show({
          severity: 'success',
          summary: 'Equipo actualizado',
          detail: 'Se ha actualizado correctamente.',
        });
        this.resetearFormulario();
        this.mostrarDrawer = false;
        this.cargarEquipos();
      },
      error: (err: HttpErrorResponse) => {
        this.toastService.show({
          severity: 'error',
          summary: 'Error al actualizar el equipo',
          detail: err.error?.detail || 'Error inesperado.',
        });
      }
    });
  } else {
    this.equipoService.altaEquipo(datosEquipo).subscribe({
      next: (equipo: EquipoDTO) => {
        this.toastService.show({
          severity: 'success',
          summary: 'Equipo creado',
          detail: 'Se ha creado correctamente.',
        });
        this.resetearFormulario();
        this.mostrarDrawer = false;
        this.cargarEquipos();
      },
      error: (err: HttpErrorResponse) => {
        this.toastService.show({
          severity: 'error',
          summary: 'Error al crear el equipo',
          detail: err.error?.detail || 'Error inesperado.',
        });
      },
    });
  }
}

  cargarEquipos(): void {
    this.equipoService
      .getTodosLosEquipos()
      .pipe(take(1))
      .subscribe({
        next: (equipos: EquipoDTO[]) => {
          this.equipos = equipos;
        },
        error: (err: HttpErrorResponse) => {
          this.toastService.show({
            severity: 'error',
            summary: 'Error al obtener los equipos',
            detail: err.error?.detail || 'Error inesperado.',
          });
        },
      });
  }
}

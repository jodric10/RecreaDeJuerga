import { Component, inject, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ToastService } from '../../services/toastMessage/toast.service';
import { ClasificacionService } from '../../services/clasificacion/clasificacion.service';
import {
  FormControl,
  FormGroup,
  ReactiveFormsModule,
  Validators,
} from '@angular/forms';
import { ClasificacionDTO } from '../../models/clasificacion/clasificacion';
import { take } from 'rxjs';
import { ClasificacionEditarDTO } from '../../models/clasificacion/clasificacionFormulario';

@Component({
  selector: 'app-clasificacion-admin',
  imports: [ReactiveFormsModule],
  templateUrl: './clasificacion-admin.component.html',
  styleUrl: './clasificacion-admin.component.css',
})
export class ClasificacionAdminComponent implements OnInit {
  private clasificacionService = inject(ClasificacionService);
  private route = inject(ActivatedRoute);
  private toastService = inject(ToastService);
  private router = inject(Router);

  nombreEquipo: string = '';
  formularioClasificacion: FormGroup | null = null;
  clasificacion: ClasificacionDTO | null = null;

  ngOnInit(): void {
    const nombreEquipoURL = this.route.snapshot.params['nombreEquipo'];
    this.nombreEquipo = nombreEquipoURL.replace(/_/g, ' ');
    this.cargarClasificacion();
  }

  resetearFormulario(): void {
    this.formularioClasificacion?.reset();
  }

  volverAtras() {
    this.router.navigate(['app','admin',this.nombreEquipo,'menu']);
  }

  onSubmit(): void {
    const datosClasificacion: ClasificacionEditarDTO = this
      .formularioClasificacion?.value as ClasificacionEditarDTO;
    this.clasificacionService
      .editarClasificacionEquipo(this.clasificacion!.id, datosClasificacion)
      .pipe(take(1))
      .subscribe({
        next: (clasificacion: ClasificacionDTO) => {
          this.toastService.show({
            severity: 'success',
            summary: 'Clasificación actualizada',
            detail: 'Se ha actualizado correctamente.',
          });
          this.clasificacionService.clearClasificacionCache();
          this.cargarClasificacion();
        },
      });
  }

  cargarClasificacion(): void {
    this.clasificacionService
      .getClasificacionPorEquipo(this.nombreEquipo)
      .pipe(take(1))
      .subscribe({
        next: (clasificacion: ClasificacionDTO) => {
          this.clasificacion = clasificacion;
          this.formularioClasificacion = new FormGroup({
            puntos: new FormControl(clasificacion.puntos, [
              Validators.required,
              Validators.min(0),
            ]),
            partidosJugados: new FormControl(clasificacion.partidosJugados, [
              Validators.required,
              Validators.min(0),
            ]),
            ganados: new FormControl(clasificacion.ganados, [
              Validators.required,
              Validators.min(0),
            ]),
            empatados: new FormControl(clasificacion.empatados, [
              Validators.required,
              Validators.min(0),
            ]),
            perdidos: new FormControl(clasificacion.perdidos, [
              Validators.required,
              Validators.min(0),
            ]),
            golesAFavor: new FormControl(clasificacion.golesAFavor, [
              Validators.required,
              Validators.min(0),
            ]),
            golesContra: new FormControl(clasificacion.golesContra, [
              Validators.required,
              Validators.min(0),
            ]),
          });
        },
      });
  }
}

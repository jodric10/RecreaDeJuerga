import { Injectable } from '@angular/core';
import { BehaviorSubject, map, Observable, ReplaySubject } from 'rxjs';
import { EquipoDTO } from '../../models/equipo/equipo';
import { HttpClient } from '@angular/common/http';
import { EquipoFormularioDTO } from '../../models/equipo/equipoFormulario';
import { EquipoSimpleDTO } from '../../models/equipo/equipoSimple';

@Injectable({
  providedIn: 'root',
})
export class EquipoService {
  private readonly api_url = 'http://localhost:8080/equipos';

  private equipoSeleccionadoSubject = new BehaviorSubject<EquipoDTO | null>(
    null
  );
  equipoSeleccionado$ = this.equipoSeleccionadoSubject.asObservable();

  constructor(private http: HttpClient) {}

  getTodosLosEquipos(): Observable<EquipoDTO[]> {
    return this.http.get<EquipoDTO[]>(this.api_url);
  }

  getEquipoPorNombre(nombre: string): Observable<EquipoDTO> {
    return this.http.get<EquipoDTO>(
      `${this.api_url}/nombre/${encodeURIComponent(nombre)}`
    );
  }

  getEquipo(equipoId: string): Observable<EquipoDTO> {
    return this.http.get<EquipoDTO>(`${this.api_url}/${equipoId}`);
  }

  altaEquipo(datosFormulario: EquipoFormularioDTO): Observable<EquipoDTO> {
    return this.http.post<EquipoDTO>(`${this.api_url}/alta`, datosFormulario);
  }

  editarEquipo(
    equipoId: string,
    datosFormulario: EquipoFormularioDTO
  ): Observable<EquipoDTO> {
    return this.http.put<EquipoDTO>(
      `${this.api_url}/${equipoId}`,
      datosFormulario
    );
  }

  eliminarEquipo(equipoId: string): Observable<any> {
    return this.http.delete(`${this.api_url}/${equipoId}`);
  }

  setEquipoSeleccionado(equipo: EquipoDTO | null): void {
    this.equipoSeleccionadoSubject.next(equipo);
  }
}

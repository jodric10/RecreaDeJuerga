import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject, map, Observable, of, take, tap } from 'rxjs';
import { ClasificacionDTO } from '../../models/clasificacion/clasificacion';
import { ClasificacionEditarDTO } from '../../models/clasificacion/clasificacionFormulario';

@Injectable({
  providedIn: 'root',
})
export class ClasificacionService {
  private readonly api_url = 'http://localhost:8080/clasificacion';
  constructor(private http: HttpClient) {}

  private clasificacionSubject = new BehaviorSubject<ClasificacionDTO[]>([]);
  public clasificacion$ = this.clasificacionSubject.asObservable();

  getClasificacion(): void {
    if (this.clasificacionSubject.value.length > 0) {
      return;
    }
    this.http
      .get<ClasificacionDTO[]>(this.api_url)
      .subscribe((clasificacion) => {
        this.clasificacionSubject.next(clasificacion);
      });
  }

  getClasificacionPorEquipo(
    nombreEquipo: string
  ): Observable<ClasificacionDTO> {
    const clasificacion = this.clasificacionSubject.getValue();

    if (clasificacion && clasificacion.length > 0) {
      const encontrado = clasificacion.find(
        (e) => e.equipo.nombre === nombreEquipo
      );
      return of(encontrado!);
    } else {
      return this.http.get<ClasificacionDTO>(
        `${this.api_url}/equipo/${encodeURIComponent(nombreEquipo)}`
      );
    }
  }

  clearClasificacionCache(): void {
    this.clasificacionSubject.next([]);
  }

  editarClasificacionEquipo(
    id: string,
    datos: ClasificacionEditarDTO
  ): Observable<ClasificacionDTO> {
    return this.http.put<ClasificacionDTO>(`${this.api_url}/${id}`, datos).pipe(
      tap((actualizado) => {
        this.clasificacion$.pipe(take(1)).subscribe((lista) => {
          const nuevaLista = lista.map((item) =>
            item.id === actualizado.id ? actualizado : item
          );
          this.clasificacionSubject.next(nuevaLista);
        });
      })
    );
  }
}

import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { map, Observable, ReplaySubject, take, tap } from 'rxjs';
import { ClasificacionDTO } from '../../models/clasificacion/clasificacion';
import { ClasificacionEditarDTO } from '../../models/clasificacion/clasificacionFormulario';

@Injectable({
  providedIn: 'root'
})
export class ClasificacionService {
  private readonly api_url = 'http://localhost:8080/clasificacion';
  constructor(private http: HttpClient) { }

    private clasificacionSubject = new ReplaySubject<ClasificacionDTO[]>(1);
    public clasificacion$ = this.clasificacionSubject.asObservable();
  

  getClasificacion(): void{
      this.http.get<ClasificacionDTO[]>(this.api_url).subscribe((clasificacion: ClasificacionDTO[])=>{
        this.clasificacionSubject.next(clasificacion);
      })
  }

  getClasificacionPorEquipo(nombreEquipo: string): Observable<ClasificacionDTO | undefined>{
     return this.clasificacion$.pipe(
          map((clasificacion: ClasificacionDTO[]) => clasificacion.find(e => e.equipo.nombre === nombreEquipo))
        ); 
  }

   editarClasificacionEquipo(id: string, datos: ClasificacionEditarDTO): Observable<ClasificacionDTO> {
    return this.http.put<ClasificacionDTO>(`${this.api_url}/${id}`, datos).pipe(
      tap(actualizado => {
        this.clasificacion$.pipe(take(1)).subscribe(lista => {
          const nuevaLista = lista.map(item =>
            item.id === actualizado.id ? actualizado : item
          );
          this.clasificacionSubject.next(nuevaLista);
        });
      })
    );
  }
}

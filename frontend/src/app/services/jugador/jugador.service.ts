import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable, of, tap } from 'rxjs';
import { JugadorDTO } from '../../models/jugador/jugador';
import { JugadorFormularioDTO } from '../../models/jugador/jugadorFormulario';

@Injectable({
  providedIn: 'root',
})
export class JugadorService {
  private readonly api_url = 'http://localhost:8080/jugadores';

  private jugadoresSubject = new BehaviorSubject<JugadorDTO[] | null>(null);
  jugadores$ = this.jugadoresSubject.asObservable();

  private jugadorSeleccionadoSubject = new BehaviorSubject<JugadorDTO | null>(
    null
  );
  jugadorSeleccionado$ = this.jugadorSeleccionadoSubject.asObservable();

  constructor(private http: HttpClient) {}

  getJugadoresDeUnEquipo(equipoId: string): Observable<JugadorDTO[]> {
    const cache = this.jugadoresSubject.value;

    if (cache && cache.length > 0) {
      return of(cache);
    } else {
      return this.http
        .get<JugadorDTO[]>(`${this.api_url}/equipo/${equipoId}`)
        .pipe(
          tap((jugadores: JugadorDTO[]) =>
            this.jugadoresSubject.next(jugadores)
          )
        );
    }
  }

  getJugador(jugadorId: string): Observable<JugadorDTO> {
    const cache = this.jugadoresSubject.value;
    const jugador = cache?.find((j) => j.id === jugadorId);

    if (jugador) {
      return of(jugador);
    } else {
      return this.http.get<JugadorDTO>(`${this.api_url}/${jugadorId}`);
    }
  }

  seleccionarJugador(jugador: JugadorDTO): void {
    this.jugadorSeleccionadoSubject.next(jugador);
  }

  clearJugadoresCache(): void {
    this.jugadoresSubject.next(null);
  }

  altaJugador(datosFormulario: JugadorFormularioDTO): Observable<JugadorDTO> {
    return this.http.post<JugadorDTO>(`${this.api_url}/alta`, datosFormulario);
  }

  editarJugador(
    jugadorId: string,
    datosFormulario: JugadorFormularioDTO
  ): Observable<JugadorDTO> {
    return this.http.put<JugadorDTO>(
      `${this.api_url}/${jugadorId}`,
      datosFormulario
    );
  }

  eliminarJugador(jugadorId: string): Observable<any> {
    return this.http.delete(`${this.api_url}/${jugadorId}`);
  }
}

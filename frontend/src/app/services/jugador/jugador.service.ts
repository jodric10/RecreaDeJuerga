import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { JugadorDTO } from '../../models/jugador/jugador';
import { JugadorFormularioDTO } from '../../models/jugador/jugadorFormulario';

@Injectable({
  providedIn: 'root',
})
export class JugadorService {
  private readonly api_url = 'http://localhost:8080/jugadores';

  constructor(private http: HttpClient) {}

  getJugadoresDeUnEquipo(equipoId: string): Observable<JugadorDTO[]> {
    return this.http.get<JugadorDTO[]>(`${this.api_url}/equipo/${equipoId}`);
  }

  getJugador(jugadorId: string): Observable<JugadorDTO> {
    return this.http.get<JugadorDTO>(`${this.api_url}/${jugadorId}`);
  }

  altaJugador(datosFormulario: JugadorFormularioDTO): Observable<JugadorDTO> {
    return this.http.post<JugadorDTO>(`${this.api_url}/alta`, datosFormulario);
  }

  editarJugador(jugadorId: string, datosFormulario: JugadorFormularioDTO): Observable<JugadorDTO> {
    return this.http.put<JugadorDTO>(`${this.api_url}/${jugadorId}`, datosFormulario);
  }

  eliminarJugador(jugadorId: string): Observable<any> {
    return this.http.delete(`${this.api_url}/${jugadorId}`);
  }
}

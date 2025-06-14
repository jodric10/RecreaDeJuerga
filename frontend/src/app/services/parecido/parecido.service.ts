import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { JugadorParecidoDTO } from '../../models/parecido/jugadorParecido';
import { Observable } from 'rxjs';
import { JugadorParecidoFormularioDTO } from '../../models/parecido/jugadorParecidoFormulario';

@Injectable({
  providedIn: 'root',
})
export class ParecidoService {
  private readonly api_url = 'http://localhost:8080/jugadoresParecidos';

  constructor(private http: HttpClient) {}

  getParecidosDeUnJugador(jugadorId: string): Observable<JugadorParecidoDTO[]> {
    return this.http.get<JugadorParecidoDTO[]>(`${this.api_url}/${jugadorId}`);
  }

  altaParecido(datosFormulario: JugadorParecidoFormularioDTO,jugadorId: string): Observable<JugadorParecidoDTO> {
    return this.http.post<JugadorParecidoDTO>(`${this.api_url}/alta/${jugadorId}`, datosFormulario);
  }

  editarParecido(parecidoId: string, datosFormulario: JugadorParecidoFormularioDTO): Observable<JugadorParecidoDTO> {
    return this.http.put<JugadorParecidoDTO>(`${this.api_url}/${parecidoId}`, datosFormulario);
  }

  eliminarParecido(parecidoId: string): Observable<any> {
    return this.http.delete(`${this.api_url}/${parecidoId}`);
  }
  
}

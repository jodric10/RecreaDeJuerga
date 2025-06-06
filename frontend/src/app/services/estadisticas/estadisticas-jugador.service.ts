import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { EstadisticasJugadorPartidoDTO } from '../../models/estadisticas/estadisticasJugadorPartido';
import { EstadisticasJugadorPartidoActualizarDTO } from '../../models/estadisticas/estadisticasJugadorPartidoActualizar';
import { EstadisticasJugadorPartidoInsertarDTO } from '../../models/estadisticas/estadisticasJugadorPartidoInsertar';

@Injectable({
  providedIn: 'root',
})
export class EstadisticasJugadorService {
  private readonly api_url = 'http://localhost:8080/api/estadisticas';

  constructor(private http: HttpClient) {}

  getEstadisticasPorPartido(
    partidoId: string
  ): Observable<EstadisticasJugadorPartidoDTO[]> {
    return this.http.get<EstadisticasJugadorPartidoDTO[]>(
      `${this.api_url}/partido/${partidoId}`
    );
  }

  getEstadisticasDeUnJugador(
    jugadorId: string
  ): Observable<EstadisticasJugadorPartidoDTO[]> {
    return this.http.get<EstadisticasJugadorPartidoDTO[]>(
      `${this.api_url}/jugador/${jugadorId}`
    );
  }

  altaEstadistica(
    datosFormulario: EstadisticasJugadorPartidoInsertarDTO
  ): Observable<EstadisticasJugadorPartidoDTO> {
    return this.http.post<EstadisticasJugadorPartidoDTO>(
      `${this.api_url}/alta`,
      datosFormulario
    );
  }

  editarEquipoeditarEstadistica(
    estadisticaId: string,
    datosFormulario: EstadisticasJugadorPartidoActualizarDTO
  ): Observable<EstadisticasJugadorPartidoDTO> {
    return this.http.put<EstadisticasJugadorPartidoDTO>(
      `${this.api_url}/${estadisticaId}`,
      datosFormulario
    );
  }

  eliminarEstadistica(estadisticaId: string): Observable<any> {
    return this.http.delete(`${this.api_url}/${estadisticaId}`);
  }
}

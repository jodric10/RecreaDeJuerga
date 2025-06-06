import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { PartidoDTO } from '../../models/partido/partido';
import { PartidoFormularioDTO } from '../../models/partido/partidoFormulario';

@Injectable({
  providedIn: 'root',
})
export class PartidoService {
  private readonly api_url = 'http://localhost:8080/partidos';

  constructor(private http: HttpClient) {}

  getPartidosById(partidoId: string): Observable<PartidoDTO> {
    return this.http.get<PartidoDTO>(`${this.api_url}/${partidoId}`);
  }

  getPartidosDeUnEquipo(equipoId: string): Observable<PartidoDTO[]> {
    return this.http.get<PartidoDTO[]>(`${this.api_url}/equipo/${equipoId}`);
  }

  altaPartido(datosFormulario: PartidoFormularioDTO): Observable<PartidoDTO> {
    return this.http.post<PartidoDTO>(`${this.api_url}/alta`, datosFormulario);
  }

  editarJugador(
    partidoId: string,
    datosFormulario: PartidoFormularioDTO
  ): Observable<PartidoDTO> {
    return this.http.put<PartidoDTO>(
      `${this.api_url}/${partidoId}`,
      datosFormulario
    );
  }

  eliminarPartido(partidoId: string): Observable<any> {
    return this.http.delete(`${this.api_url}/${partidoId}`);
  }
}

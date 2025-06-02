import { TestBed } from '@angular/core/testing';

import { EstadisticasJugadorService } from './estadisticas-jugador.service';

describe('EstadisticasJugadorService', () => {
  let service: EstadisticasJugadorService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(EstadisticasJugadorService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});

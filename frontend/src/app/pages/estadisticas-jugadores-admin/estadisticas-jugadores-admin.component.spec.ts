import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EstadisticasJugadoresAdminComponent } from './estadisticas-jugadores-admin.component';

describe('EstadisticasJugadoresAdminComponent', () => {
  let component: EstadisticasJugadoresAdminComponent;
  let fixture: ComponentFixture<EstadisticasJugadoresAdminComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [EstadisticasJugadoresAdminComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(EstadisticasJugadoresAdminComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

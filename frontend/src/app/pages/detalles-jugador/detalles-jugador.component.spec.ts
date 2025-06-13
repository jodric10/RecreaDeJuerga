import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DetallesJugadorComponent } from './detalles-jugador.component';

describe('DetallesJugadorComponent', () => {
  let component: DetallesJugadorComponent;
  let fixture: ComponentFixture<DetallesJugadorComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [DetallesJugadorComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(DetallesJugadorComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

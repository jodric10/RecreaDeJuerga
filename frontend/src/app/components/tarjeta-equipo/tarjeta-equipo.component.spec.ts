import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TarjetaEquipoComponent } from './tarjeta-equipo.component';

describe('TarjetaEquipoComponent', () => {
  let component: TarjetaEquipoComponent;
  let fixture: ComponentFixture<TarjetaEquipoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [TarjetaEquipoComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(TarjetaEquipoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

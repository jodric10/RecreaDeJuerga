import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TarjetaValorComponent } from './tarjeta-valor.component';

describe('TarjetaValorComponent', () => {
  let component: TarjetaValorComponent;
  let fixture: ComponentFixture<TarjetaValorComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [TarjetaValorComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(TarjetaValorComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

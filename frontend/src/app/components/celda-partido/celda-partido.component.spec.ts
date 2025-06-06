import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CeldaPartidoComponent } from './celda-partido.component';

describe('CeldaPartidoComponent', () => {
  let component: CeldaPartidoComponent;
  let fixture: ComponentFixture<CeldaPartidoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [CeldaPartidoComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CeldaPartidoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

import { ComponentFixture, TestBed } from '@angular/core/testing';

import { JugadoresAdminComponent } from './jugadores-admin.component';

describe('JugadoresAdminComponent', () => {
  let component: JugadoresAdminComponent;
  let fixture: ComponentFixture<JugadoresAdminComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [JugadoresAdminComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(JugadoresAdminComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

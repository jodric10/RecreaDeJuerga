import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CromoComponent } from './cromo.component';

describe('CromoComponent', () => {
  let component: CromoComponent;
  let fixture: ComponentFixture<CromoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [CromoComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CromoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

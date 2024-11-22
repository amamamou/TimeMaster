import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TeacherDetailComponent } from './teacher-detail.component';

describe('TeacherDetailComponent', () => {
  let component: TeacherDetailComponent;
  let fixture: ComponentFixture<TeacherDetailComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [TeacherDetailComponent]
    });
    fixture = TestBed.createComponent(TeacherDetailComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

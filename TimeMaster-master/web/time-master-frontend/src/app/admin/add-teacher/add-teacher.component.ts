import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { TeachersService } from 'src/app/services/teachers.service';

@Component({
  selector: 'app-add-teacher',
  templateUrl: './add-teacher.component.html',
  styleUrls: ['./add-teacher.component.css']
})
export class AddTeacherComponent {


  teacherForm: FormGroup;

  constructor(
    private fb: FormBuilder,
    private teacherService: TeachersService,
    private router: Router // Injecter le service Router
  ) {
    this.teacherForm = this.fb.group({
      username: ['', [Validators.required]],
      password: ['', [Validators.required]],
      role: ['', [Validators.required]],
      MaxDeysPerWeeks: ['', [Validators.required]],
      maxHoursPerDay: ['', [Validators.required]],
      maxGapsPerDay: ['', [Validators.required]],
      subjectSpecialization: ['', [Validators.required]],
      assignedActivities: ['', [Validators.required]],
      email: ['', [Validators.required]],
    });
  }

  ngOnInit(): void {}

  onSubmit(): void {
    if (this.teacherForm.valid) {
      this.teacherService.addTeacher(this.teacherForm.value).subscribe(() => {
        // Rediriger vers la liste des étudiants après l'ajout
        this.router.navigate(['/teachers']);
      });
    }
  }
  goBack(): void {
    this.router.navigate(['/teachers']);  // Redirection vers la page des étudiants
  }

}

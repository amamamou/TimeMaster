import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { StudentsService } from 'src/app/services/students.service';
import { Router } from '@angular/router';  // Pour la redirection après ajout

@Component({
  selector: 'app-add-student',
  templateUrl: './add-student.component.html',
  styleUrls: ['./add-student.component.css']
})
export class AddStudentComponent implements OnInit {
  studentForm: FormGroup;

  constructor(
    private fb: FormBuilder,
    private studentsService: StudentsService,
    private router: Router // Injecter le service Router
  ) {
    this.studentForm = this.fb.group({
      username: ['', [Validators.required]],
      password: ['', [Validators.required]],
      role: ['', [Validators.required]],
      overlappingGroups: ['', [Validators.required]],
      
      email: ['', [Validators.required]],
    });
  }

  ngOnInit(): void {}

  onSubmit(): void {
    if (this.studentForm.valid) {
      this.studentsService.addStudent(this.studentForm.value).subscribe(() => {
        // Rediriger vers la liste des étudiants après l'ajout
        this.router.navigate(['/students']);
      });
    }
  }
  goBack(): void {
    this.router.navigate(['/students']);  // Redirection vers la page des étudiants
  }
}

import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms'; // Importations pour le formulaire
import { Router } from '@angular/router';
import { Student } from 'src/app/models/student.model';
import { StudentsService } from 'src/app/services/students.service';

@Component({
  selector: 'app-students',
  templateUrl: './students.component.html',
  styleUrls: ['./students.component.css']
})
export class StudentsComponent implements OnInit {
  students: Student[] = [];
  isEditing: boolean = false;  // Pour activer le mode édition
  currentStudentId: number | null = null;  // Pour garder l'étudiant en cours d'édition
  editStudentForm: FormGroup;  // Formulaire d'édition
  selectedStudent: Student | null = null;
  studentForm :FormGroup;
  constructor(
    private studentsService: StudentsService,
    private fb: FormBuilder ,
    private router: Router// Utilisation de FormBuilder pour créer des formulaires réactifs
  ) {
    // Initialisation du formulaire
    this.editStudentForm = this.fb.group({
      username: ['', Validators.required],
      password: ['', Validators.required],
      role: ['', Validators.required],
      overlappingGroups: ['', Validators.required],
      email:['', Validators.required]
    });
    this.studentForm = this.fb.group({
      username: ['', Validators.required],
      password: ['', Validators.required],
      role: ['', Validators.required],
      
      overlappingGroups: ['', Validators.required],
      email:['', Validators.required]
    });
  }

  ngOnInit(): void {
    this.getStudents();
  }

  getStudents(): void {
    this.studentsService.getAllStudents().subscribe((data: Student[]) => {
      this.students = data;
    });
  }

  deleteStudent(id: number): void {
    this.studentsService.deleteStudent(id).subscribe(
      () => {
        console.log('Student deleted successfully');
        this.students = this.students.filter(student => student.id !== id);
      },
      error => {
        console.log('Error deleting student', error);
      }
    );
  }

  // Démarrer l'édition d'un étudiant
  startEditing(student: Student): void {
    this.isEditing = true;  // Active le mode édition
    this.currentStudentId = student.id;  // Stocke l'ID de l'étudiant à éditer

    // Remplir le formulaire avec les informations de l'étudiant
    this.editStudentForm.patchValue({
      username: student.username,
      password: student.password,
      role: student.role,
      overlappingGroups: student.overlappingGroups,
      email: student.email
    });
  }

  // Annuler l'édition
  cancelEditing(): void {
    this.isEditing = false;  // Désactive le mode édition
    this.currentStudentId = null;
  }

  // Enregistrer les modifications
  updateStudent(): void {
    if (this.editStudentForm.valid && this.currentStudentId !== null) {
      this.studentsService.updateStudent(this.currentStudentId, this.editStudentForm.value).subscribe(
        () => {
          console.log('Student updated successfully');
          this.getStudents();  // Recharge la liste des étudiants après la mise à jour
          this.isEditing = false;
          this.currentStudentId = null;
        },
        error => {
          console.log('Error updating student', error);
        }
      );
    }
  }


  getStudentDetails(id: number): void {
    this.studentsService.getStudentById(id).subscribe(
      (student: Student) => {
        this.selectedStudent = student; // Stocker les détails de l'étudiant sélectionné
      },
      (error) => {
        console.log('Error fetching student details', error);
      }
    );
  }

  // Pour masquer les détails
  clearSelectedStudent(): void {
    this.selectedStudent = null;
  }

  onSubmit(): void {
    if (this.studentForm.valid) {
      this.studentsService.addStudent(this.studentForm.value).subscribe((student) => {
        this.students.push(student); // Ajouter le nouveau enseignant à la liste
        this.studentForm.reset(); // Réinitialiser le formulaire
      });
    }
  }
  clearForm(): void {
    this.studentForm.reset();
    this.isEditing = false;
   
  }

  goToAddStudentPage(): void {
    this.router.navigate(['/add-student']);
  }

}

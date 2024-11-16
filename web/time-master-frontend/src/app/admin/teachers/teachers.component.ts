import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms'; // Importations pour le formulaire
import { Teacher } from 'src/app/models/teacher.model';
import { TeachersService } from 'src/app/services/teachers.service';

@Component({
  selector: 'app-teachers',
  templateUrl: './teachers.component.html',
  styleUrls: ['./teachers.component.css']
})
export class TeachersComponent implements OnInit {
  teachers: Teacher[] = [];
  isEditing: boolean = false;  // Pour activer le mode édition
  currentTeacherId: number | null = null;  // Pour garder le professeur en cours d'édition
  editTeacherForm: FormGroup;  // Formulaire d'édition
  selectedTeacher: Teacher | null = null;
  
  constructor(
    private teachersService: TeachersService,
    private fb: FormBuilder // Utilisation de FormBuilder pour créer des formulaires réactifs
  ) {
    // Initialisation du formulaire avec les attributs corrects
    this.editTeacherForm = this.fb.group({
      username: ['', Validators.required],
      maxDaysPerWeek: [null, Validators.required],
      maxHoursPerDay: [null, Validators.required],
      maxGapsPerDay: [null, Validators.required],
      subjectSpecialization: ['', Validators.required], // Assuming a string input for simplicity
      assignedActivities: ['', Validators.required]     // Assuming a string input for simplicity
    });
  }

  ngOnInit(): void {
    this.getTeachers();
  }

 
  getTeachers(): void {
    this.teachersService.getAllTeachers().subscribe((data: Teacher[]) => {
      this.teachers = data;
    });
  }

  deleteTeacher(id: number): void {
    this.teachersService.deleteTeacher(id).subscribe(
      () => {
        console.log('Teacher deleted successfully');
        this.teachers = this.teachers.filter(teacher => teacher.id !== id);
      },
      error => {
        console.log('Error deleting teacher', error);
      }
    );
  }

  // Démarrer l'édition d'un professeur
  startEditing(teacher: Teacher): void {
    console.log('Teacher selected for editing:', teacher);

    this.isEditing = true;  // Active le mode édition
    this.currentTeacherId = teacher.id;  // Stocke l'ID du professeur à éditer

    // Remplir le formulaire avec les informations du professeur
    this.editTeacherForm.patchValue({
      username: teacher.username,
      maxDaysPerWeek: teacher.maxDaysPerWeek,
      maxHoursPerDay: teacher.maxHoursPerDay,
      maxGapsPerDay: teacher.maxGapsPerDay,
      subjectSpecialization: teacher.subjectSpecialization, // Assuming comma-separated values for display
      assignedActivities: teacher.assignedActivities        // Assuming comma-separated values for display
    });
  }

  // Annuler l'édition
  cancelEditing(): void {
    this.isEditing = false;  // Désactive le mode édition
    this.currentTeacherId = null;
  }

  // Enregistrer les modifications
  updateTeacher(): void {
    if (this.editTeacherForm.valid && this.currentTeacherId !== null) {
      this.teachersService.updateTeacher(this.currentTeacherId, this.editTeacherForm.value).subscribe(
        () => {
          console.log('Teacher updated successfully');
          this.getTeachers();  // Recharge la liste des professeurs après la mise à jour
          this.isEditing = false;
          this.currentTeacherId = null;
        },
        error => {
          console.log('Error updating teacher', error);
        }
      );
    }
  }

  getTeacherDetails(id: number): void {
    this.teachersService.getTeacherById(id).subscribe(
      (teacher: Teacher) => {
        this.selectedTeacher = teacher; // Stocker les détails du professeur sélectionné
      },
      (error) => {
        console.log('Error fetching teacher details', error);
      }
    );
  }

  // Pour masquer les détails
  clearSelectedTeacher(): void {
    this.selectedTeacher = null;
  }
}

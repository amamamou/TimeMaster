

import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Student } from 'src/app/models/student.model';

 // Assurez-vous que cela correspond à votre modèle
import { StudentsService } from 'src/app/services/students.service';

@Component({
  selector: 'app-student-detail',
  templateUrl: './student-detail.component.html',
  styleUrls: ['./student-detail.component.css'],
})
export class StudentDetailComponent implements OnInit {
  student!: Student; // Déclarez une propriété pour stocker l'étudiant

  constructor(
    private route: ActivatedRoute,
    private studentsService: StudentsService,
  ) {}

  ngOnInit(): void {
    const id = this.route.snapshot.paramMap.get('id'); // Récupérez l'ID de l'étudiant à partir de l'URL
    if (id) {
      this.studentsService.getStudentById(+id).subscribe((data) => {
        this.student = data; // Affectez les données à la propriété student
      });
    }
  }
}

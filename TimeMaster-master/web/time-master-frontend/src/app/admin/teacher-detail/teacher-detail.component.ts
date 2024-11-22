// teacher-detail.component.ts
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Teacher } from 'src/app/models/teacher.model';
import { TeachersService } from 'src/app/services/teachers.service';

@Component({
  selector: 'app-teacher-detail',
  templateUrl: './teacher-detail.component.html',
  styleUrls: ['./teacher-detail.component.css'],
})
export class TeacherDetailComponent implements OnInit {
  teacher!: Teacher; // Propriété pour stocker les données de l'enseignant

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private teachersService: TeachersService,
  ) {}

  ngOnInit(): void {
    const id = this.route.snapshot.paramMap.get('id'); // Récupère l'ID de l'enseignant dans l'URL
    if (id) {
      this.teachersService.getTeacherById(+id).subscribe((data) => {
        this.teacher = data; // Affecte les données de l'enseignant
      });
    }
  }

  backToTeacherList(): void {
    this.router.navigate(['/teachers']);
  }

}

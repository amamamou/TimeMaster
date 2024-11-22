import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { DashboardComponent } from './dashboard/dashboard.component';
import { StudentsComponent } from './students/students.component';
import { TeachersComponent } from './teachers/teachers.component';
import { StudentDetailComponent } from './student-detail/student-detail.component';

import { TeacherDetailComponent } from './teacher-detail/teacher-detail.component';

import { RoomsComponent } from './rooms/rooms.component';
import { EtablissementComponent } from './etablissement/etablissement.component';
import { AddStudentComponent } from './add-student/add-student.component';
import { AddTeacherComponent } from './add-teacher/add-teacher.component';




const routes: Routes = [
  { path: 'dashboard', component: DashboardComponent},
  { path: 'students', component: StudentsComponent },
  { path: 'teachers', component:TeachersComponent},
  { path: 'students/:id', component: StudentDetailComponent },

  { path: 'teachers/:id', component: TeacherDetailComponent },
  { path: 'add-student', component: AddStudentComponent },
  { path: 'add-teacher', component: AddTeacherComponent },
  {path:'rooms', component: RoomsComponent},
  { path: 'etabli', component: EtablissementComponent }

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AdminRoutingModule { }

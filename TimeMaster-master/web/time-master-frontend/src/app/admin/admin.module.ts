import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule, FormsModule } from '@angular/forms'; // Import FormsModule

import { AdminRoutingModule } from './admin-routing.module';

import { DashboardComponent } from './dashboard/dashboard.component';
import { StudentsComponent } from './students/students.component';
import { TeachersComponent } from './teachers/teachers.component';
import { StudentDetailComponent } from './student-detail/student-detail.component';

import { TeacherDetailComponent } from './teacher-detail/teacher-detail.component';


import { AdminSidebarComponent } from './admin-sidebar/admin-sidebar.component';
import { RoomsComponent } from './rooms/rooms.component';
import { EtablissementComponent } from './etablissement/etablissement.component';
import { AddStudentComponent } from './add-student/add-student.component';
import { AddTeacherComponent } from './add-teacher/add-teacher.component';


@NgModule({
  declarations: [
    DashboardComponent,
    StudentsComponent,
    TeachersComponent,
    StudentDetailComponent,
    
    TeacherDetailComponent,
   
    AdminSidebarComponent,
    RoomsComponent,
    EtablissementComponent,
    AddStudentComponent,
    AddTeacherComponent,

  ],
  imports: [
    CommonModule,
    AdminRoutingModule,
    ReactiveFormsModule,
    FormsModule, // Add FormsModule here
  ],
})
export class AdminModule {}

import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AdminRoutingModule } from './admin-routing.module';

import { DashboardComponent } from './dashboard/dashboard.component';
import { StudentsComponent } from './students/students.component';
import { TeachersComponent } from './teachers/teachers.component';
import { ReactiveFormsModule } from '@angular/forms';
import { StudentDetailComponent } from './student-detail/student-detail.component';
import { AdminSidebarComponent } from './admin-sidebar/admin-sidebar.component';
import { RoomsComponent } from './rooms/rooms.component';


@NgModule({
  declarations: [
    DashboardComponent,
    StudentsComponent,
    TeachersComponent,
    StudentDetailComponent,
    AdminSidebarComponent,
    RoomsComponent,
   
  ],
  imports: [
    CommonModule,
    AdminRoutingModule,
    ReactiveFormsModule
  ]
})
export class AdminModule { }

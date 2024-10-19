import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { DashboardComponent } from './dashboard/dashboard.component';
import { StudentsComponent } from './students/students.component';
import { TeachersComponent } from './teachers/teachers.component';
import { StudentDetailComponent } from './student-detail/student-detail.component';

 


const routes: Routes = [
  { path: 'dashboard', component: DashboardComponent},
  { path: 'students', component: StudentsComponent },
  { path: 'teachers', component:TeachersComponent},
  { path: 'students/:id', component: StudentDetailComponent },
  
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AdminRoutingModule { }

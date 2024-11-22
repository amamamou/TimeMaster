import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './user/login/login.component';
import { HomeComponent } from './home/home.component';
import { DashboardComponent } from './admin/dashboard/dashboard.component';
import { StudentsComponent } from './admin/students/students.component';
import { TeachersComponent } from './admin/teachers/teachers.component';
import { AdminSidebarComponent } from './admin/admin-sidebar/admin-sidebar.component';
import { UserDashboardComponent } from './users/user-dashboard/user-dashboard.component';
import { SchoolTimetableComponent } from './users/school-timetable/school-timetable.component';
import { DiscussionResultsComponent } from './users/discussion-results/discussion-results.component';
import { EtablissementComponent } from './admin/etablissement/etablissement.component';
import { StudentDetailComponent } from './admin/student-detail/student-detail.component';
import { TeacherDetailComponent } from './admin/teacher-detail/teacher-detail.component';
import { RoomsComponent } from './admin/rooms/rooms.component';
import { AddStudentComponent } from './admin/add-student/add-student.component';
import { AddTeacherComponent } from './admin/add-teacher/add-teacher.component';


const routes: Routes = [
  { path: 'home', component: HomeComponent },
  { path: 'login', component: LoginComponent },
  { path: 'dashboard', component: DashboardComponent },
  { path: 'students', component: StudentsComponent },
  { path: 'teachers', component: TeachersComponent },
  { path: 'students/:id', component: StudentDetailComponent },
  { path: 'teachers/:id', component: TeacherDetailComponent },
  { path: 'sidebar',component:AdminSidebarComponent },
  { path: 'userdashboard',component:UserDashboardComponent },
  { path: 'timetable', component: SchoolTimetableComponent },
  { path: 'etabli', component: EtablissementComponent },
  { path: 'discussion-results', component: DiscussionResultsComponent },
  { path: 'rooms', component: RoomsComponent },
  { path: 'add-student', component: AddStudentComponent },
  { path: 'add-teacher', component: AddTeacherComponent },
  { path: '', redirectTo: '/home', pathMatch: 'full' }, // Default route
  { path: '**', redirectTo: '/home' } // Wildcard route for invalid URLs

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

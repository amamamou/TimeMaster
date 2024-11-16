import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HomeComponent } from './home/home.component';
import { LoginComponent } from './user/login/login.component';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule } from '@angular/forms';

// Importez le module Admin ici
import { AdminModule } from './admin/admin.module';
import { UserSidebarComponent } from './users/user-sidebar/user-sidebar.component';
import { UserDashboardComponent } from './users/user-dashboard/user-dashboard.component';
import { HeaderComponent } from './users/header/header.component';
import { ActionCardComponent } from './users/action-card/action-card.component';
import { SchoolTimetableComponent } from './users/school-timetable/school-timetable.component';
import { DiscussionResultsComponent } from './users/discussion-results/discussion-results.component'; // Assurez-vous que le chemin est correct
import { UserService } from './users/user.service';
import { SettingsComponent } from './users/settings/settings.component';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    LoginComponent,
    UserSidebarComponent,
    UserDashboardComponent,
    HeaderComponent,
    ActionCardComponent,
    SchoolTimetableComponent,
    DiscussionResultsComponent,
    SettingsComponent,
    // Pas besoin de déclarer DashboardComponent ici, il est déjà déclaré dans AdminModule
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule, // Assurez-vous que ceci est présent
    HttpClientModule, // Ajoutez HttpClientModule ici
    AdminModule, // Ajoutez AdminModule ici
  ],
  providers: [UserService], // Make sure the service is provided
  bootstrap: [AppComponent]
})
export class AppModule { }

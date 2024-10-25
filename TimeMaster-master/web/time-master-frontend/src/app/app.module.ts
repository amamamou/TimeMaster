import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HomeComponent } from './home/home.component';
import { LoginComponent } from './user/login/login.component';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule } from '@angular/forms';

// Importez le module Admin ici
import { AdminModule } from './admin/admin.module'; // Assurez-vous que le chemin est correct

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    LoginComponent,
    // Pas besoin de déclarer DashboardComponent ici, il est déjà déclaré dans AdminModule
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule, // Assurez-vous que ceci est présent
    HttpClientModule, // Ajoutez HttpClientModule ici
    AdminModule // Ajoutez AdminModule ici
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

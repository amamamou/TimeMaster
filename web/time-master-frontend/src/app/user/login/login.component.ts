import { Component } from '@angular/core';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent {
   username: string = '';
  password: string = '';
  login() {
    console.log('Logging in with:', this.username, this.password);
    // Add login logic here
  }

}

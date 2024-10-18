import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent {
  username: string = ''; // Initialize as an empty string
  password: string = ''; // Initialize as an empty string
  errorMessage: string = ''; // Initialize as an empty string

  constructor(private authService: AuthService, private router: Router) {}

  onSubmit() {
    this.authService.login(this.username, this.password).subscribe(
      (response) => {
        if (response.body && response.body.redirectUrl) {
          console.log('Login successful!'); // Log success message in the console
          this.router.navigate([response.body.redirectUrl]); // Redirect to home
        }
      },
      (error) => {
        this.errorMessage = 'Incorrect username or password';
      }
    );
  }
}

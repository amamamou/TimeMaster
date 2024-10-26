import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent {
  identifier: string = ''; // Changed from username to identifier
  password: string = ''; // Initialize as an empty string
  errorMessage: string = ''; // Initialize as an empty string

  constructor(private authService: AuthService, private router: Router) {}

  onSubmit() {
    this.authService.login(this.identifier, this.password).subscribe(
      (response) => {
        if (response.body && response.body.redirectUrl) {
          console.log('Login successful!'); // Log success message in the console
          this.router.navigate([response.body.redirectUrl]); // Redirect to home
        }
      },
      (error) => {
        // Improved error handling
        if (error.status === 401) {
          this.errorMessage = 'Incorrect username or password'; // Custom error message for unauthorized
        } else {
          this.errorMessage = 'An error occurred. Please try again later.'; // Generic error message
        }
      }
    );
  }
}

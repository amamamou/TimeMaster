// src/app/services/auth.service.ts
import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private loginUrl = 'http://localhost:3000/users/login'; // Correct URL for the login endpoint

  constructor(private http: HttpClient) {}

  login(identifier: string, password: string): Observable<any> {
    return this.http.post(this.loginUrl, { identifier, password }, { observe: 'response' })
      .pipe(
        catchError(this.handleError) // Handle errors here if needed
      );
  }

  private handleError(error: HttpErrorResponse) {
    // Log or handle the error appropriately
    return throwError(error);
  }
}

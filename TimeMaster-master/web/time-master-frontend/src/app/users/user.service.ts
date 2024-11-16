import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class UserService {
  private apiUrl = 'http://localhost:3000/users'; // Adjust the URL to match your backend

  constructor(private http: HttpClient) {}

  // Fetch the current user's data
  getCurrentUser(): Observable<{ username: string }> {
    return this.http.get<{ username: string }>('http://localhost:3000/users/me');
  }
  
}

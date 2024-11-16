import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class EstablishmentService {
  private apiUrl = 'http://localhost:3000/establishments'; // Update with your actual API URL

  constructor(private http: HttpClient) {}

  getAllEstablishments(): Observable<any[]> {
    return this.http.get<any[]>(this.apiUrl);
  }

  // Create a new establishment
  createEstablishment(establishment: { name: string; address: string; phone: string; email: string }): Observable<any> {
    return this.http.post<any>(this.apiUrl, establishment);
  }

  // Update an establishment by ID
  updateEstablishment(id: number, updateData: { name: string, address: string, phone: string, email: string }): Observable<any> {
    return this.http.put<any>(`${this.apiUrl}/${id}`, updateData);
  }

  // Delete an establishment by ID
  deleteEstablishment(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}

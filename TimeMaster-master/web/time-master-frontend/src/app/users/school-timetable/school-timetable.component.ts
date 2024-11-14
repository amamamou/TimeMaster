import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-school-timetable',
  templateUrl: './school-timetable.component.html',
  styleUrls: ['./school-timetable.component.css']
})
export class SchoolTimetableComponent {

  // private apiUrl = 'http://localhost:3000/users';

  // constructor(private http : HttpClient){}

  // getUserName(userId: number): Observable<any> {
  //   return this.http.get(`${this.apiUrl}/user/${userId}`);
  // }

  // updateUserName(userId: number, name: string): Observable<any> {
  //   return this.http.put(`${this.apiUrl}/user/${userId}`, { name });
  // }


  schoolName: string = 'Greenwood High School'; // Example school name
  className: string = 'Grade 10 - Section A';    // Example class name

  
  // timetable data (rows represent days, columns represent periods)
  timetable = [
    { day: 'Monday', subjects: ['Math', 'Science', 'History', 'PE', 'Art'] },
    { day: 'Tuesday', subjects: ['English', 'Math', ' ', 'Music', 'Geography'] },
    { day: 'Wednesday', subjects: ['Physics', 'Chemistry', 'Math', 'Art', 'PE'] },
    { day: 'Thursday', subjects: ['History', 'Science', 'English', 'Math', 'Computer'] },
    { day: 'Friday', subjects: ['Geography', 'Math', 'Chemistry', '', ''] }
  ];
}

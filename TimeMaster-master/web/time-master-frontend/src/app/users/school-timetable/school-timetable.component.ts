import { Component, OnInit } from '@angular/core';
import { UserService } from '../user.service';

@Component({
  selector: 'app-school-timetable',
  templateUrl: './school-timetable.component.html',
  styleUrls: ['./school-timetable.component.css'],
})
export class SchoolTimetableComponent implements OnInit {
  userName: string = ''; // Store the username
  schoolName: string = 'ISET Sousse'; // Example school name
  className: string = 'DSI3.1'; // Example class name

  timetable = [
    { day: 'Monday', subjects: ['Math', 'Science', 'History', 'PE', 'Art'] },
    { day: 'Tuesday', subjects: ['English', 'Math', ' ', 'Music', 'Geography'] },
    { day: 'Wednesday', subjects: ['Physics', 'Chemistry', 'Math', 'Art', 'PE'] },
    { day: 'Thursday', subjects: ['History', 'Science', 'English', 'Math', 'Computer'] },
    { day: 'Friday', subjects: ['Geography', 'Math', 'Chemistry', '', ''] },
  ];

  constructor(private userService: UserService) {}

  ngOnInit(): void {
    this.userService.getCurrentUser().subscribe(
      (response) => {
        this.userName = response.username; // Assign the username from the response
      },
      (error) => {
        console.error('Error fetching user name:', error);
      }
    );
  }
  
}

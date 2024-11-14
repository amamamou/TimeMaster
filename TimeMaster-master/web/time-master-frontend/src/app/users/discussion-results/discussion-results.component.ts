import { Component } from '@angular/core';

@Component({
  selector: 'app-discussion-results',
  templateUrl: './discussion-results.component.html',
  styleUrls: ['./discussion-results.component.css']
})
export class DiscussionResultsComponent {
  teacherName: string = '';
  message: string = '';
  responseMessage: string = '';

  sendMessage() {
    if (this.teacherName && this.message) {
      // Placeholder logic for sending the message
      // In a real app, you'd use an HTTP request to send this data to a server.
      console.log(`Message from ${this.teacherName}: ${this.message}`);
      this.responseMessage = 'Your message has been sent to the admin.';
      
      // Reset the form
      this.teacherName = '';
      this.message = '';
    } else {
      this.responseMessage = 'Please fill in all fields.';
    }
  }
}

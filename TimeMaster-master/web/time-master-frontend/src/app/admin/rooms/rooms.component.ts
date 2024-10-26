import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Room } from 'src/app/models/room.model';
import { RoomService } from 'src/app/services/room.service';

@Component({
  selector: 'app-rooms',
  templateUrl: './rooms.component.html',
  styleUrls: ['./rooms.component.css'],
})
export class RoomsComponent implements OnInit {
  rooms: Room[] = [];
  roomForm: FormGroup;
  isEditing: boolean = false;
  currentRoomId: number | null = null;

  constructor(private roomService: RoomService, private formBuilder: FormBuilder) {
    this.roomForm = this.formBuilder.group({
      name: ['', Validators.required],
      capacity: [0, [Validators.required, Validators.min(1)]],
    });
  }

  ngOnInit(): void {
    this.loadRooms();
  }

  // Load rooms from the backend
  loadRooms(): void {
    this.roomService.getRooms().subscribe(
      (rooms) => {
        this.rooms = rooms;
      },
      (error) => {
        console.error('Error fetching rooms:', error);
      }
    );
  }

  // Add or update a room
  onSubmit(): void {
    if (this.roomForm.invalid) {
      return;
    }

    const roomData = this.roomForm.value;
    if (this.isEditing && this.currentRoomId !== null) {
      this.roomService.updateRoom(this.currentRoomId, roomData).subscribe(
        () => {
          this.loadRooms();
          this.clearForm();
        },
        (error) => {
          console.error('Error updating room:', error);
        }
      );
    } else {
      this.roomService.addRoom(roomData).subscribe(
        (response) => {
          console.log('Room added successfully:', response);
          this.loadRooms();
          this.clearForm();
        },
        (error) => {
          console.error('Error adding room:', error);
        }
      );
    }
  }

  // Edit a room
  editRoom(room: Room): void {
    this.isEditing = true;
    this.currentRoomId = room.roomID; // Assuming roomID is the identifier
    this.roomForm.setValue({
      name: room.name,
      capacity: room.capacity,
    });
  }

  // Delete a room
  deleteRoom(id: number): void {
    this.roomService.deleteRoom(id).subscribe(
      () => {
        this.loadRooms();
      },
      (error) => {
        console.error('Error deleting room:', error);
      }
    );
  }

  // Clear form
  clearForm(): void {
    this.roomForm.reset();
    this.isEditing = false;
    this.currentRoomId = null;
  }
}

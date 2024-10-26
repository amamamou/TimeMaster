/* eslint-disable prettier/prettier */
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateRoomDto } from './dto/create-room.dto';
import { UpdateRoomDto } from './dto/update-room.dto';
import { Room } from './entities/room.entity';

@Injectable()
export class RoomsService {
  constructor(
    @InjectRepository(Room)
    private readonly roomRepository: Repository<Room>,
  ) {}

  // Create a new room
  async create(createRoomDto: CreateRoomDto): Promise<Room> {
    const newRoom = this.roomRepository.create(createRoomDto);
    return this.roomRepository.save(newRoom); // Save to database
  }

  // Get all rooms
  async findAll(): Promise<Room[]> {
    return this.roomRepository.find(); // Fetch from database
  }

  // Get a specific room by ID
  async findOne(id: number): Promise<Room> {
    return this.roomRepository.findOne({ where: { roomID: id } }); // Fetch by ID
  }

  // Update an existing room
  async update(id: number, updateRoomDto: UpdateRoomDto): Promise<Room> {
    await this.roomRepository.update(id, updateRoomDto);
    return this.findOne(id); // Return the updated room
  }

  // Delete a room
  async remove(id: number): Promise<void> {
    await this.roomRepository.delete(id); // Delete from database
  }
}

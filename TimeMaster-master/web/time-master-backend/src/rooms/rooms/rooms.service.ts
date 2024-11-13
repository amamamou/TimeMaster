/* eslint-disable prettier/prettier */
import { Injectable, BadRequestException } from '@nestjs/common';
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

  // Create a new room with a unique name check
  async create(createRoomDto: CreateRoomDto): Promise<Room> {
    const existingRoom = await this.roomRepository.findOne({ where: { name: createRoomDto.name } });
    if (existingRoom) {
      throw new BadRequestException('Room name already exists.');
    }
    const newRoom = this.roomRepository.create(createRoomDto);
    return this.roomRepository.save(newRoom);
  }

  // Get all rooms
  async findAll(): Promise<Room[]> {
    return this.roomRepository.find();
  }

  // Get a specific room by ID
  async findOne(id: number): Promise<Room> {
    return this.roomRepository.findOne({ where: { roomID: id } });
  }

  // Update an existing room with a unique name check
  async update(id: number, updateRoomDto: UpdateRoomDto): Promise<Room> {
    const existingRoom = await this.roomRepository.findOne({ where: { name: updateRoomDto.name } });
    if (existingRoom && existingRoom.roomID !== id) {
      throw new BadRequestException('Room name already exists.');
    }
    await this.roomRepository.update(id, updateRoomDto);
    return this.findOne(id);
  }

  // Delete a room
  async remove(id: number): Promise<void> {
    await this.roomRepository.delete(id);
  }
}

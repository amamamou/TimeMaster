/* eslint-disable prettier/prettier */
import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { RoomsService } from './rooms.service';
import { RoomsController } from './rooms.controller';
import { Room } from './entities/room.entity'; // Ensure this path is correct

@Module({
  imports: [TypeOrmModule.forFeature([Room])], // Use TypeOrmModule to inject the Room entity
  controllers: [RoomsController],
  providers: [RoomsService],
})
export class RoomsModule {}

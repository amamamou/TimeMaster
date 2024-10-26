/* eslint-disable prettier/prettier */
import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { UsersModule } from './users/users.module'; // Import your user module here
import { User } from './users/entities/user.entity';
import { AppService } from './app.service';
import { UsersController } from './users/users/users.controller';
import { Students } from './users/entities/student.entity';
import { Room } from './rooms/rooms/entities/room.entity'; // Keeping this import
import { RoomsModule } from './rooms/rooms/rooms.module'; // Keeping this import
import { MatiereModule } from './matiere/matiere.module'; // Keeping this import
import { Matiere } from './users/entities/matiere.entity'; // Keeping this import
//import { MatiereController } from './matiere/matiere.controller'; // Keeping this import

@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'mysql',
      host: process.env.DB_HOST || 'localhost',
      port: 3306, // Default MySQL port
      username: process.env.DB_USER || 'root',
      password: process.env.DB_PASSWORD || '',
      database: process.env.DB_NAME || 'timemaster',
      entities: [User, Students, Room, Matiere], // Add your entities here
      synchronize: true, // Set to false in production
    }),
    UsersModule,
    RoomsModule, // Include RoomsModule here
    MatiereModule, // Include MatiereModule here
  ],
  controllers: [UsersController],
  providers: [AppService],
})
export class AppModule {}

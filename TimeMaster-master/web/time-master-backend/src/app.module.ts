/* eslint-disable prettier/prettier */
import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { UsersModule } from './users/users.module'; // Import your user module here
import { User } from './users/entities/user.entity';
import { AppService } from './app.service';
import { UsersController } from './users/users/users.controller';
import { Students } from './users/entities/student.entity';
import { MatiereModule } from './matiere/matiere.module';
import { Matiere } from './users/entities/matiere.entity';
import { MatiereController } from './matiere/matiere.controller';

@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'mysql',
      host: process.env.DB_HOST || 'localhost',
      port: 3306, // Default MySQL port
      username: process.env.DB_USER || 'root',
      password: process.env.DB_PASSWORD || '',
      database: process.env.DB_NAME || 'timemaster',
      entities: [User,Students,Matiere], // Add your entities here
      synchronize: true, // Set to false in production
    }),
    UsersModule,
    MatiereModule,],
    
  
  controllers: [UsersController],
  providers: [AppService , UsersModule] , // Provide the AppService
})
export class AppModule {}

/* eslint-disable prettier/prettier */
import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { UsersModule } from './users/users.module'; // Import your user module here
import { User } from './users/entities/user.entity';
import { AppService } from './app.service';
import { UsersController } from './users/users/users.controller';

import { Teacher } from './users/entities/teacher.entity';


@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'mysql',
      host: process.env.DB_HOST || 'localhost',
      port: 3306, // Default MySQL port
      username: process.env.DB_USER || 'root',
      password: process.env.DB_PASSWORD || '',
      database: process.env.DB_NAME || 'timemaster',
<<<<<<< HEAD:web/time-master-backend/src/app.module.ts
      entities: [User,Students,Teacher], // Add your entities here
=======
      entities: [User], // Add your entities here
>>>>>>> 3524e184910ea2dd72f86ef50e190daea7f75950:TimeMaster-master/mobile/time-master-backend/src/app.module.ts
      synchronize: true, // Set to false in production
    }),
    
    UsersModule, // Add your user module here
  ],
  controllers: [UsersController],
  providers: [AppService], // Provide the AppService
})
export class AppModule {}

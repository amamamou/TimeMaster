/* eslint-disable prettier/prettier */
import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from './entities/user.entity';
import { UsersController } from './users/users.controller';
import { UsersService } from './users/users.service';
import { StudentsController } from './students/students.controller';
import { StudentsService } from './students/students.service';
import { Students } from './entities/student.entity';

@Module({
    imports: [TypeOrmModule.forFeature([User,Students])], 
    controllers: [UsersController, StudentsController],
    providers: [UsersService, StudentsService],
    exports: [UsersService], 
})
export class UsersModule {}

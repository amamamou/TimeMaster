/* eslint-disable prettier/prettier */
import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from './entities/user.entity';
import { UsersController } from './users/users.controller';
import { UsersService } from './users/users.service';
import { StudentsController } from './students/students.controller';
import { StudentsService } from './students/students.service';
import { Students } from './entities/student.entity';
import { TeachersController } from './teachers/teachers.controller';
import { TeachersService } from './teachers/teachers.service';
import { Teacher } from './entities/teacher.entity';

@Module({
    imports: [TypeOrmModule.forFeature([User,Students,Teacher])], 
    controllers: [UsersController, StudentsController, TeachersController],
    providers: [UsersService, StudentsService, TeachersService],
    exports: [UsersService], 
})
export class UsersModule {}

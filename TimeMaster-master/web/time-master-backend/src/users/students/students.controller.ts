import {
  Controller,
  Get,
  Post,
  Param,
  Body,
  Delete,
  Put,
} from '@nestjs/common';
import { StudentsService } from './students.service';
import { Students } from '../entities/student.entity';

@Controller('students')
export class StudentsController {
  constructor(private readonly studentsService: StudentsService) {}

  @Post()
  async createStudent(
    @Body('username') username: string,
    @Body('password') password: string,
    @Body('role') role: string,
    @Body('overlappingGroups') overlappingGroups: string,
    @Body('email') email: string,
  ): Promise<Students> {
    return this.studentsService.createStudent(
      username,
      password,
      role,
      overlappingGroups,
      email,
    );
  }

  @Get()
  async findAllStudents(): Promise<Students[]> {
    return this.studentsService.findAllStudents();
  }

  @Get(':id')
  async findStudentById(@Param('id') id: number): Promise<Students> {
    return this.studentsService.findStudentById(id);
  }

  @Delete(':id')
  async deleteStudent(@Param('id') id: number): Promise<void> {
    return this.studentsService.deleteStudent(id);
  }
  @Put(':id') // Ajout du PUT pour la mise à jour
  async updateStudent(
    @Param('id') id: number,
    @Body('username') username: string,
    @Body('password') password: string,
    @Body('role') role: string,
    @Body('overlappingGroups') overlappingGroups: string,
    @Body('email') email: string,
  ): Promise<Students> {
    return this.studentsService.updateStudent(
      id,
      username,
      password,
      role,
      overlappingGroups,
      email,
    );
  }
}

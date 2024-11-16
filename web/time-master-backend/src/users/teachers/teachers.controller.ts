import { Controller, Get, Post, Param, Body, Delete, Put } from '@nestjs/common';
import { TeachersService } from './teachers.service';
import { Teacher } from '../entities/teacher.entity';

@Controller('teachers')
export class TeachersController {
  constructor(private readonly teachersService: TeachersService) {}

  @Post()
  async createTeacher(
    @Body('username') username: string,
    @Body('password') password: string,
    @Body('role') role: string,
    @Body('availability') availability: string,
    @Body('maxDaysPerWeek') maxDaysPerWeek: number,
    @Body('maxHoursPerDay') maxHoursPerDay: number,
    @Body('maxGapsPerDay') maxGapsPerDay: number,
    @Body('subjectSpecialization') subjectSpecialization: string,
  ): Promise<Teacher> {
    return this.teachersService.createTeacher(
      username, password, role, availability, maxDaysPerWeek, maxHoursPerDay, maxGapsPerDay, subjectSpecialization
    );
  }

  @Get()
  async findAllTeachers(): Promise<Teacher[]> {
    return this.teachersService.findAllTeachers();
  }

  @Get(':id')
  async findTeacherById(@Param('id') id: number): Promise<Teacher> {
    return this.teachersService.findTeacherById(id);
  }

  @Delete(':id')
  async deleteTeacher(@Param('id') id: number): Promise<void> {
    return this.teachersService.deleteTeacher(id);
  }

  @Put(':id')
  async updateTeacher(
    @Param('id') id: number,
    @Body('username') username: string,
    @Body('password') password: string,
    @Body('role') role: string,
    @Body('availability') availability: string,
    @Body('maxDaysPerWeek') maxDaysPerWeek: number,
    @Body('maxHoursPerDay') maxHoursPerDay: number,
    @Body('maxGapsPerDay') maxGapsPerDay: number,
    @Body('subjectSpecialization') subjectSpecialization: string,
  ): Promise<Teacher> {
    return this.teachersService.updateTeacher(
      id, username, password, role, availability, maxDaysPerWeek, maxHoursPerDay, maxGapsPerDay, subjectSpecialization
    );
  }
    
}

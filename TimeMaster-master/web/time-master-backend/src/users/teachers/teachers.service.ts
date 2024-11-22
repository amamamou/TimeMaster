import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { teachers } from '../entities/teacher.entity';

@Injectable()
export class TeachersService {
  constructor(
    @InjectRepository(teachers)
    private readonly teachersRepository: Repository<teachers>,
  ) {}

  async findAllTeachers(): Promise<teachers[]> {
    return this.teachersRepository.find();
  }

  async findTeacherById(id: number): Promise<teachers> {
    return this.teachersRepository.findOneBy({ id });
  }

  async deleteTeacher(id: number): Promise<void> {
    await this.teachersRepository.delete(id);
  }

  async createTeacher(
    username: string,
    password: string,
    role: string,
    availability: string,
    maxDaysPerWeek: number,
    maxHoursPerDay: number,
    maxGapsPerDay: number,
    subjectSpecialization: string,
    assignedActivities: string,
    email: string,
  ): Promise<teachers> {
    const newTeacher = this.teachersRepository.create({
      username,
      password,
      role,
      availability,
      maxDaysPerWeek,
      maxHoursPerDay,
      maxGapsPerDay,
      subjectSpecialization,
      assignedActivities,
      email,
    });
    return this.teachersRepository.save(newTeacher);
  }

  async updateTeacher(
    id: number,
    username: string,
    password: string,
    role: string,
    availability: string,
    maxDaysPerWeek: number,
    maxHoursPerDay: number,
    maxGapsPerDay: number,
    subjectSpecialization: string,
    assignedActivities:string,
    email: string,
  ): Promise<teachers> {
    const teacher = await this.findTeacherById(id); // Vérifie si l'enseignant existe

    // Mise à jour des champs
    teacher.username = username;
    teacher.password = password;
    teacher.role = role;
    teacher.availability = availability;
    teacher.maxDaysPerWeek = maxDaysPerWeek;
    teacher.maxHoursPerDay = maxHoursPerDay;
    teacher.maxGapsPerDay = maxGapsPerDay;
    teacher.subjectSpecialization = subjectSpecialization;
    teacher.assignedActivities = assignedActivities;
    teacher.email=email;
    return this.teachersRepository.save(teacher); // Sauvegarde les modifications
  }
}

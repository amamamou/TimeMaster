import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Teacher } from '../entities/teacher.entity';

@Injectable()
export class TeachersService {
  constructor(
    @InjectRepository(Teacher)
    private readonly teachersRepository: Repository<Teacher>,
  ) {}

 

  async findAllTeachers(): Promise<Teacher[]> {
    return this.teachersRepository.find();
  }

  async findTeacherById(id: number): Promise<Teacher> {
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
  ): Promise<Teacher> {
    const newTeacher = this.teachersRepository.create({username,password,role,availability,maxDaysPerWeek,maxHoursPerDay,maxGapsPerDay,subjectSpecialization});
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
  ): Promise<Teacher> {
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

    return this.teachersRepository.save(teacher); // Sauvegarde les modifications
  }
    
}

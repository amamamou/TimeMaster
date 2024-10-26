import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Students } from '../entities/student.entity';


@Injectable()
export class StudentsService {
  constructor(
    @InjectRepository(Students)
    private readonly studentsRepository: Repository<Students>,
  ) {}

  async createStudent(
    username: string,
    password: string,
    role: string,
    overlappingGroups: string ,
  ): Promise<Students> {
    const newStudent = this.studentsRepository.create({ username, password, role, overlappingGroups });
    return this.studentsRepository.save(newStudent);
  }

  async findAllStudents(): Promise<Students[]> {
    return this.studentsRepository.find();
  }

  async findStudentById(id: number): Promise<Students> {
    return this.studentsRepository.findOneBy({ id });
  }

  async deleteStudent(id: number): Promise<void> {
    await this.studentsRepository.delete(id);
  }

  async updateStudent(id: number, username: string, password: string, role: string, overlappingGroups: string): Promise<Students> {
    const student = await this.findStudentById(id); // Vérifie si l'étudiant existe

    // Mise à jour des champs
    student.username = username;
    student.password = password;
    student.role = role;
    student.overlappingGroups = overlappingGroups;

    return this.studentsRepository.save(student); // Sauvegarde les modifications
  }
}

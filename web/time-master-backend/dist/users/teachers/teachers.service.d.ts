import { Repository } from 'typeorm';
import { Teacher } from '../entities/teacher.entity';
export declare class TeachersService {
    private readonly teachersRepository;
    constructor(teachersRepository: Repository<Teacher>);
    findAllTeachers(): Promise<Teacher[]>;
    findTeacherById(id: number): Promise<Teacher>;
    deleteTeacher(id: number): Promise<void>;
    createTeacher(username: string, password: string, role: string, availability: string, maxDaysPerWeek: number, maxHoursPerDay: number, maxGapsPerDay: number, subjectSpecialization: string): Promise<Teacher>;
    updateTeacher(id: number, username: string, password: string, role: string, availability: string, maxDaysPerWeek: number, maxHoursPerDay: number, maxGapsPerDay: number, subjectSpecialization: string): Promise<Teacher>;
}

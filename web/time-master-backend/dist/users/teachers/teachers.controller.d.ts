import { TeachersService } from './teachers.service';
import { Teacher } from '../entities/teacher.entity';
export declare class TeachersController {
    private readonly teachersService;
    constructor(teachersService: TeachersService);
    createTeacher(username: string, password: string, role: string, availability: string, maxDaysPerWeek: number, maxHoursPerDay: number, maxGapsPerDay: number, subjectSpecialization: string): Promise<Teacher>;
    findAllTeachers(): Promise<Teacher[]>;
    findTeacherById(id: number): Promise<Teacher>;
    deleteTeacher(id: number): Promise<void>;
    updateTeacher(id: number, username: string, password: string, role: string, availability: string, maxDaysPerWeek: number, maxHoursPerDay: number, maxGapsPerDay: number, subjectSpecialization: string): Promise<Teacher>;
}

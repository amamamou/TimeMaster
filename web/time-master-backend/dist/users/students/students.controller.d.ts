import { StudentsService } from './students.service';
import { Students } from '../entities/student.entity';
export declare class StudentsController {
    private readonly studentsService;
    constructor(studentsService: StudentsService);
    createStudent(username: string, password: string, role: string, overlappingGroups: string): Promise<Students>;
    findAllStudents(): Promise<Students[]>;
    findStudentById(id: number): Promise<Students>;
    deleteStudent(id: number): Promise<void>;
    updateStudent(id: number, username: string, password: string, role: string, overlappingGroups: string): Promise<Students>;
}

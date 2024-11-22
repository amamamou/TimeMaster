import { Repository } from 'typeorm';
import { Students } from '../entities/student.entity';
export declare class StudentsService {
    private readonly studentsRepository;
    constructor(studentsRepository: Repository<Students>);
    createStudent(username: string, password: string, role: string, overlappingGroups: string): Promise<Students>;
    findAllStudents(): Promise<Students[]>;
    findStudentById(id: number): Promise<Students>;
    deleteStudent(id: number): Promise<void>;
    updateStudent(id: number, username: string, password: string, role: string, overlappingGroups: string): Promise<Students>;
}

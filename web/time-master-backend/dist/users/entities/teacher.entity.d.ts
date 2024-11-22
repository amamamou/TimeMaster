import { User } from './user.entity';
export declare class Teacher extends User {
    availability: string;
    maxDaysPerWeek: number;
    maxHoursPerDay: number;
    maxGapsPerDay: number;
    subjectSpecialization: string;
    assignedActivities: string;
}

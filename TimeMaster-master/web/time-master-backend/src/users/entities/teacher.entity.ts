/* eslint-disable prettier/prettier */
import { Column, Entity } from 'typeorm';
import { User } from './user.entity';

@Entity()
export class teachers extends User {
  @Column()
  availability: string;  // Example field for teacher availability

  @Column()
  maxDaysPerWeek: number;

  @Column()
  maxHoursPerDay: number;

  @Column()
  maxGapsPerDay: number;

  @Column()
  subjectSpecialization: string; // You may want to use a separate table for subjects

  @Column()
  assignedActivities: string; // You may also want to create an activities table
}

/* eslint-disable prettier/prettier */
import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity('rooms')
export class Room {
    @PrimaryGeneratedColumn()
    roomID: number;

    @Column()
    name: string;

    @Column()
    capacity: number;

   /* @Column('json', { nullable: true })
    availability: TimeSlot[];

    @Column('json', { nullable: true })
    assignedActivities: Activity[];

    // You can define any additional methods here if needed

*/
    }


/* eslint-disable prettier/prettier */
import { Column, Entity, PrimaryGeneratedColumn, TableInheritance } from "typeorm";

@Entity()
@TableInheritance({ column: { type: 'varchar', name: 'role' } })
export class User {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({ unique: true }) // Ensure that username is unique
    username: string;

    @Column()
    password: string;

    @Column()
    role: string;

    @Column({ unique: true }) // Ensure that email is unique
    email: string; // New email field
}

import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class Matiere {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  nom: string;
}

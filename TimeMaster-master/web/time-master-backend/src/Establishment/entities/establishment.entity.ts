import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class Establishment {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @Column()
  address: string;

  @Column()
  phone: string;

  @Column()
  email: string;
}

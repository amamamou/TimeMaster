/* eslint-disable prettier/prettier */
import { Column, Entity } from 'typeorm';
import { User } from './user.entity';

@Entity()
export class Students extends User {
  @Column()
  overlappingGroups: string ;  // Example of a field specific to students

  
}

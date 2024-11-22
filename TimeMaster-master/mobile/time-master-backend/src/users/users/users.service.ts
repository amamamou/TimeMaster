/* eslint-disable prettier/prettier */
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { User } from '../entities/user.entity';
import * as bcrypt from 'bcrypt';

@Injectable()
export class UsersService {
  constructor(
    @InjectRepository(User)
    private usersRepository: Repository<User>,
  ) {}

  async validateUser(identifier: string, password: string): Promise<User | null> {
    // Check if the identifier is an email or username and search accordingly
    const user = await this.usersRepository.findOne({
      where: [{ username: identifier }, { email: identifier }] // Searching by either username or email
    });

    if (user && await bcrypt.compare(password, user.password)) {
      return user; 
    }
    return null;
  }

  async addUser(username: string, password: string, email: string, role: string): Promise<User> {
    const hashedPassword = await bcrypt.hash(password, 10);
    const user = this.usersRepository.create({ username, password: hashedPassword, email, role });
    return this.usersRepository.save(user);
  }
}

/* eslint-disable prettier/prettier */
import { Controller, Post, Body, Session, Res } from '@nestjs/common';
import { UsersService } from './users.service';
import { Response } from 'express';
import { User } from '../entities/user.entity';

@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Post('login')
  async login(
    @Body('identifier') identifier: string, // This can be username or email
    @Body('password') password: string,
    @Session() session: Record<string, any>,
    @Res() res: Response,
  ) {
    const user = await this.usersService.validateUser(identifier, password); // Pass identifier
    if (user) {
      session.userId = user.id; // Save user info in session
  
      // Check user role and set redirect URL
      const redirectUrl = user.role === 'Admin' ? '/dashboard' : '/';
      
      return res.status(200).json({ message: 'Login successful', redirectUrl });
    } else {
      return res.status(401).json({ message: 'Incorrect username or password' });
    }
  }
  
  @Post('add')
  async addUser(@Body() userData: { username: string; password: string; email: string; role: string }): Promise<User> {
    return this.usersService.addUser(userData.username, userData.password, userData.email, userData.role);
  }
}

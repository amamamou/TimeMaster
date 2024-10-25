/* eslint-disable prettier/prettier */
import { Controller, Post, Body, Session, Res } from '@nestjs/common';
import { UsersService } from './users.service';
import { Response } from 'express';

@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Post('login')
  async login(
    @Body('username') username: string,
    @Body('password') password: string,
    @Session() session: Record<string, any>,
    @Res() res: Response,
  ) {
    const user = await this.usersService.validateUser(username, password);
    if (user) {
      session.userId = user.id; // Save user info in session
      return res.status(200).json({ message: 'Login successful', redirectUrl: '/tabBar' });
    } else {
      return res.status(401).json({ message: 'Incorrect username or password' });
    }
  }
}

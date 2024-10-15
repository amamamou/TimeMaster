/* eslint-disable prettier/prettier */
import { Controller, Post, Req, Res } from '@nestjs/common';
import { Request, Response } from 'express';
import { UsersService } from './users.service'; 

@Controller('users') // /users
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Post('login') // /users/login
  async login(@Req() req: Request, @Res() res: Response) {
    const { username, password } = req.body;

    const user = await this.usersService.validateUser(username, password);

    if (user) {
      req.session.user = user; 
      return res.status(200).json({ message: 'Login successful', user });
    } else {
      return res.status(401).json({ message: 'Invalid credentials' });
    }
  }
}

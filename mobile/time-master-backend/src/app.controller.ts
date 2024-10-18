import { Controller, Post, Body } from '@nestjs/common';
import { LoginService } from './app.service';
import { LoginDto } from './login.dto';

@Controller('api') // Base route for the API
export class AppController {
  constructor(private readonly appService: LoginService) {}

  @Post('/login') // Endpoint for login
  async login(@Body() loginDto: LoginDto) {
    const { username, password } = loginDto;
    
    // Example check (you should replace this with your real authentication logic)
    if (username === 'admin' && password === 'admin') {
      return { success: true, message: 'Login successful' };
    } else {
      return { success: false, message: 'Invalid credentials' };
    }
  }
}

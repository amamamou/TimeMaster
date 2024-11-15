/* eslint-disable prettier/prettier */
import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import * as session from 'express-session';
import * as cors from 'cors';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.use(cors()); // Enable CORS for all routes

  // Initialize the MySQLStore with a session instance
  // eslint-disable-next-line @typescript-eslint/no-require-imports
  const MySQLStore = require('express-mysql-session')(session);

  const sessionStore = new MySQLStore({
    // MySQL connection options
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'timemaster',
  });

  // Use session middleware
  app.use(
    session({
      secret: 'your-secret-key', // Change this to a strong secret
      store: sessionStore,
      resave: false,
      saveUninitialized: false,
      cookie: {
        maxAge: 1000 * 60 * 60, // Session expiration (1 hour)
      },
    }),
  );
  
  await app.listen(3000);
}

bootstrap();

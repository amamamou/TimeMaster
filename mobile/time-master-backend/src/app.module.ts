import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AppController } from './app.controller';
import { LoginService } from './app.service';
import { User } from './user.entity';

@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'mysql', // or 'postgres', 'sqlite', etc.
      host: 'localhost',
      port: 3306, // default MySQL port
      username: 'root',
      password: '',
      database: 'timemaster_db',
      entities: [User],
      synchronize: true, // set to false in production
    }),
    TypeOrmModule.forFeature([User]),
  ],
  controllers: [AppController],
  providers: [LoginService],
})
export class AppModule {}

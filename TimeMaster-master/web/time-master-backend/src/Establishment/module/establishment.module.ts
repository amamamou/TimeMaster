import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Establishment } from '../entities/establishment.entity';
import { EstablishmentService } from '../service/establishment.service';
import { EstablishmentController } from '../controller/establishment.controller';

@Module({
  imports: [TypeOrmModule.forFeature([Establishment])],
  providers: [EstablishmentService],
  controllers: [EstablishmentController],
})
export class EstablishmentModule {}

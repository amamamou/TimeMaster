import { Controller, Get, Post, Body } from '@nestjs/common';
import { MatiereService } from './matiere.service';
import { Matiere } from '../users/entities/matiere.entity'; 

@Controller('matieres')
export class MatiereController {
  constructor(private readonly matiereService: MatiereService) {}

  @Post()
  async create(@Body() createMatiereDto: { nom: string }): Promise<Matiere> {
    return this.matiereService.create(createMatiereDto.nom);
  }

  @Get()
  async findAll(): Promise<Matiere[]> {
    return this.matiereService.findAll();
  }
}

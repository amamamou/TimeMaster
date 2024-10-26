import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Matiere } from '../users/entities/matiere.entity';

@Injectable()
export class MatiereService {
  constructor(
    @InjectRepository(Matiere)
    private matiereRepository: Repository<Matiere>,
  ) {}

  async create(nom: string): Promise<Matiere> {
    const matiere = this.matiereRepository.create({ nom });
    return this.matiereRepository.save(matiere);
  }

  async findAll(): Promise<Matiere[]> {
    return this.matiereRepository.find();
  }
}

import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Establishment } from '../entities/establishment.entity';

@Injectable()
export class EstablishmentService {
  constructor(
    @InjectRepository(Establishment)
    private establishmentRepository: Repository<Establishment>,
  ) {}

  async create(
    name: string,
    address: string,
    phone: string,
    email: string,
  ): Promise<Establishment> {
    const establishment = this.establishmentRepository.create({
      name,
      address,
      phone,
      email,
    });
    return this.establishmentRepository.save(establishment);
  }

  async findAll(): Promise<Establishment[]> {
    return this.establishmentRepository.find();
  }

  async update(
    id: number,
    name: string,
    address: string,
    phone: string,
    email: string,
  ): Promise<Establishment> {
    const establishment = await this.establishmentRepository.findOne({
      where: { id: id },
    });

    if (!establishment) {
      throw new Error('Establishment not found');
    }

    establishment.name = name;
    establishment.address = address;
    establishment.phone = phone;
    establishment.email = email;

    return this.establishmentRepository.save(establishment);
  }

  // Add delete method here
  async remove(id: number): Promise<void> {
    const establishment = await this.establishmentRepository.findOne({
      where: { id: id },
    });

    if (!establishment) {
      throw new Error('Establishment not found');
    }

    await this.establishmentRepository.remove(establishment);
  }
}

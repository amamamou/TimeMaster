import {
  Controller,
  Get,
  Post,
  Put,
  Delete,
  Body,
  Param,
} from '@nestjs/common';
import { EstablishmentService } from '../service/establishment.service';
import { Establishment } from '../entities/establishment.entity';

@Controller('establishments')
export class EstablishmentController {
  constructor(private readonly establishmentService: EstablishmentService) {}

  @Post()
  async create(
    @Body()
    createEstablishmentDto: {
      name: string;
      address: string;
      phone: string;
      email: string;
    },
  ): Promise<Establishment> {
    return this.establishmentService.create(
      createEstablishmentDto.name,
      createEstablishmentDto.address,
      createEstablishmentDto.phone,
      createEstablishmentDto.email,
    );
  }

  @Get()
  async findAll(): Promise<Establishment[]> {
    return this.establishmentService.findAll();
  }

  @Put(':id')
  async update(
    @Param('id') id: number,
    @Body()
    updateEstablishmentDto: {
      name: string;
      address: string;
      phone: string;
      email: string;
    },
  ): Promise<Establishment> {
    return this.establishmentService.update(
      id,
      updateEstablishmentDto.name,
      updateEstablishmentDto.address,
      updateEstablishmentDto.phone,
      updateEstablishmentDto.email,
    );
  }

  // Add delete endpoint here
  @Delete(':id')
  async remove(@Param('id') id: number): Promise<void> {
    return this.establishmentService.remove(id);
  }
}

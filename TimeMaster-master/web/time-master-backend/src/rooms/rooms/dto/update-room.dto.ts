/* eslint-disable prettier/prettier */
import { IsOptional, IsString, IsInt } from 'class-validator';

export class UpdateRoomDto {
    @IsOptional()
    @IsString()
    name?: string;

    @IsOptional()
    @IsInt()
    capacity?: number;

 /*   @IsOptional()
    @IsArray()
    availability?: TimeSlot[];

    @IsOptional()
    @IsArray()
    assignedActivities?: Activity[];*/
}

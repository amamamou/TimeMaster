/* eslint-disable prettier/prettier */
import { IsString, IsInt,  } from 'class-validator';


export class CreateRoomDto {
    @IsString()
    name: string;

    @IsInt()
    capacity: number;

   /* @IsArray()
    availability: TimeSlot[];

    @IsArray()
    assignedActivities: Activity[];*/
}

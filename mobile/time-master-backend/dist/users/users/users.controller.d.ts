import { UsersService } from './users.service';
import { Response } from 'express';
export declare class UsersController {
    private readonly usersService;
    constructor(usersService: UsersService);
    login(username: string, password: string, session: Record<string, any>, res: Response): Promise<Response<any, Record<string, any>>>;
}

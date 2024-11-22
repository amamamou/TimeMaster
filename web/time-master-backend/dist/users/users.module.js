"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.UsersModule = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const user_entity_1 = require("./entities/user.entity");
const users_controller_1 = require("./users/users.controller");
const users_service_1 = require("./users/users.service");
const students_controller_1 = require("./students/students.controller");
const students_service_1 = require("./students/students.service");
const student_entity_1 = require("./entities/student.entity");
const teachers_controller_1 = require("./teachers/teachers.controller");
const teachers_service_1 = require("./teachers/teachers.service");
const teacher_entity_1 = require("./entities/teacher.entity");
let UsersModule = class UsersModule {
};
exports.UsersModule = UsersModule;
exports.UsersModule = UsersModule = __decorate([
    (0, common_1.Module)({
        imports: [typeorm_1.TypeOrmModule.forFeature([user_entity_1.User, student_entity_1.Students, teacher_entity_1.Teacher])],
        controllers: [users_controller_1.UsersController, students_controller_1.StudentsController, teachers_controller_1.TeachersController],
        providers: [users_service_1.UsersService, students_service_1.StudentsService, teachers_service_1.TeachersService],
        exports: [users_service_1.UsersService],
    })
], UsersModule);
//# sourceMappingURL=users.module.js.map
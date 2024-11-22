"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.TeachersService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const typeorm_2 = require("typeorm");
const teacher_entity_1 = require("../entities/teacher.entity");
let TeachersService = class TeachersService {
    constructor(teachersRepository) {
        this.teachersRepository = teachersRepository;
    }
    async findAllTeachers() {
        return this.teachersRepository.find();
    }
    async findTeacherById(id) {
        return this.teachersRepository.findOneBy({ id });
    }
    async deleteTeacher(id) {
        await this.teachersRepository.delete(id);
    }
    async createTeacher(username, password, role, availability, maxDaysPerWeek, maxHoursPerDay, maxGapsPerDay, subjectSpecialization) {
        const newTeacher = this.teachersRepository.create({ username, password, role, availability, maxDaysPerWeek, maxHoursPerDay, maxGapsPerDay, subjectSpecialization });
        return this.teachersRepository.save(newTeacher);
    }
    async updateTeacher(id, username, password, role, availability, maxDaysPerWeek, maxHoursPerDay, maxGapsPerDay, subjectSpecialization) {
        const teacher = await this.findTeacherById(id);
        teacher.username = username;
        teacher.password = password;
        teacher.role = role;
        teacher.availability = availability;
        teacher.maxDaysPerWeek = maxDaysPerWeek;
        teacher.maxHoursPerDay = maxHoursPerDay;
        teacher.maxGapsPerDay = maxGapsPerDay;
        teacher.subjectSpecialization = subjectSpecialization;
        return this.teachersRepository.save(teacher);
    }
};
exports.TeachersService = TeachersService;
exports.TeachersService = TeachersService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, typeorm_1.InjectRepository)(teacher_entity_1.Teacher)),
    __metadata("design:paramtypes", [typeorm_2.Repository])
], TeachersService);
//# sourceMappingURL=teachers.service.js.map
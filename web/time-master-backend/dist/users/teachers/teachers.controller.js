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
exports.TeachersController = void 0;
const common_1 = require("@nestjs/common");
const teachers_service_1 = require("./teachers.service");
let TeachersController = class TeachersController {
    constructor(teachersService) {
        this.teachersService = teachersService;
    }
    async createTeacher(username, password, role, availability, maxDaysPerWeek, maxHoursPerDay, maxGapsPerDay, subjectSpecialization) {
        return this.teachersService.createTeacher(username, password, role, availability, maxDaysPerWeek, maxHoursPerDay, maxGapsPerDay, subjectSpecialization);
    }
    async findAllTeachers() {
        return this.teachersService.findAllTeachers();
    }
    async findTeacherById(id) {
        return this.teachersService.findTeacherById(id);
    }
    async deleteTeacher(id) {
        return this.teachersService.deleteTeacher(id);
    }
    async updateTeacher(id, username, password, role, availability, maxDaysPerWeek, maxHoursPerDay, maxGapsPerDay, subjectSpecialization) {
        return this.teachersService.updateTeacher(id, username, password, role, availability, maxDaysPerWeek, maxHoursPerDay, maxGapsPerDay, subjectSpecialization);
    }
};
exports.TeachersController = TeachersController;
__decorate([
    (0, common_1.Post)(),
    __param(0, (0, common_1.Body)('username')),
    __param(1, (0, common_1.Body)('password')),
    __param(2, (0, common_1.Body)('role')),
    __param(3, (0, common_1.Body)('availability')),
    __param(4, (0, common_1.Body)('maxDaysPerWeek')),
    __param(5, (0, common_1.Body)('maxHoursPerDay')),
    __param(6, (0, common_1.Body)('maxGapsPerDay')),
    __param(7, (0, common_1.Body)('subjectSpecialization')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, String, String, String, Number, Number, Number, String]),
    __metadata("design:returntype", Promise)
], TeachersController.prototype, "createTeacher", null);
__decorate([
    (0, common_1.Get)(),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", Promise)
], TeachersController.prototype, "findAllTeachers", null);
__decorate([
    (0, common_1.Get)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", Promise)
], TeachersController.prototype, "findTeacherById", null);
__decorate([
    (0, common_1.Delete)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", Promise)
], TeachersController.prototype, "deleteTeacher", null);
__decorate([
    (0, common_1.Put)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __param(1, (0, common_1.Body)('username')),
    __param(2, (0, common_1.Body)('password')),
    __param(3, (0, common_1.Body)('role')),
    __param(4, (0, common_1.Body)('availability')),
    __param(5, (0, common_1.Body)('maxDaysPerWeek')),
    __param(6, (0, common_1.Body)('maxHoursPerDay')),
    __param(7, (0, common_1.Body)('maxGapsPerDay')),
    __param(8, (0, common_1.Body)('subjectSpecialization')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number, String, String, String, String, Number, Number, Number, String]),
    __metadata("design:returntype", Promise)
], TeachersController.prototype, "updateTeacher", null);
exports.TeachersController = TeachersController = __decorate([
    (0, common_1.Controller)('teachers'),
    __metadata("design:paramtypes", [teachers_service_1.TeachersService])
], TeachersController);
//# sourceMappingURL=teachers.controller.js.map
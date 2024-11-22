"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Tableteachers1729801760931 = void 0;
class Tableteachers1729801760931 {
    constructor() {
        this.name = 'Tableteachers1729801760931';
    }
    async up(queryRunner) {
        await queryRunner.query(`CREATE TABLE \`teachers\` (\`id\` int NOT NULL AUTO_INCREMENT, \`username\` varchar(255) NOT NULL, \`password\` varchar(255) NOT NULL, \`role\` varchar(255) NOT NULL, \`availability\` varchar(255) NOT NULL, \`maxDaysPerWeek\` int NOT NULL, \`maxHoursPerDay\` int NOT NULL, \`maxGapsPerDay\` int NOT NULL, \`subjectSpecialization\` varchar(255) NOT NULL, \`assignedActivities\` varchar(255) NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
    }
    async down(queryRunner) {
        await queryRunner.query(`DROP TABLE \`teachers\``);
    }
}
exports.Tableteachers1729801760931 = Tableteachers1729801760931;
//# sourceMappingURL=1729801760931-tableteachers.js.map
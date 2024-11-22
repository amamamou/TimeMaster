import { MigrationInterface, QueryRunner } from "typeorm";

export class Tableteachers1729801760931 implements MigrationInterface {
    name = 'Tableteachers1729801760931'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`CREATE TABLE \`teachers\` (\`id\` int NOT NULL AUTO_INCREMENT, \`username\` varchar(255) NOT NULL, \`password\` varchar(255) NOT NULL, \`role\` varchar(255) NOT NULL, \`availability\` varchar(255) NOT NULL, \`maxDaysPerWeek\` int NOT NULL, \`maxHoursPerDay\` int NOT NULL, \`maxGapsPerDay\` int NOT NULL, \`subjectSpecialization\` varchar(255) NOT NULL, \`assignedActivities\` varchar(255) NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`DROP TABLE \`teachers\``);
    }

}

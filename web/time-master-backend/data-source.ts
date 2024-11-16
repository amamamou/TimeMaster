import { DataSource } from 'typeorm';
import * as dotenv from 'dotenv';

dotenv.config(); // Charge les variables d'environnement

const AppDataSource = new DataSource({
    type: 'mysql', // Type de base de données, par exemple 'mysql'
    host: process.env.DB_HOST,
    port: Number(process.env.DB_PORT),
    username: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    synchronize: true, // Ne pas synchroniser automatiquement les entités avec la base de données
    logging: false,
    
        entities: [__dirname + '/**/*.entity{.ts,.js}'],
    
   
    migrations: [__dirname + '/migrations/**/*{.ts,.js}'],
});

export default AppDataSource;

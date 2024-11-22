export interface Teacher { 
  
  id: number;           // L'identifiant de l'étudiant
  username: string;     // Le nom d'utilisateur de l'étudiant
  password: string;     // Le mot de passe de l'étudiant
  role: string;                // Unique identifier for the teacher              
  availability: String;         // Time slots when the teacher is available
  maxDaysPerWeek: number;           // Maximum working days in a week
  maxHoursPerDay: number;           // Maximum teaching hours in a day
  maxGapsPerDay: number;            // Maximum allowed gaps between lessons per day
  subjectSpecialization: String; // Subjects the teacher can teach
  assignedActivities:String; 
  email:string;  // Activities assigned to the teacher

}

export interface Student {
    id: number;           // L'identifiant de l'étudiant
    username: string;     // Le nom d'utilisateur de l'étudiant
    password: string;     // Le mot de passe de l'étudiant
    role: string;         // Le rôle de l'étudiant
    overlappingGroups?: string;  // Optionnel - Les groupes superposés
    email: string;
    
  }
  
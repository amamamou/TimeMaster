import { Component } from '@angular/core';
import { EstablishmentService } from './service/establishment.service'; // Ensure the service is imported correctly

@Component({
  selector: 'app-etablissement',
  templateUrl: './etablissement.component.html',
  styleUrls: ['./etablissement.component.css'],
})
export class EtablissementComponent {
  schoolName: string = '';
  address: string = '';
  phone: string = '';
  email: string = '';
  establishments: any[] = [];
  selectedEstablishmentId: number | null = null;  // Track the selected establishment for updating

  constructor(private establishmentService: EstablishmentService) {}

  showAllEstablishments() {
    this.establishmentService.getAllEstablishments().subscribe((data) => {
      this.establishments = data;
      console.log(this.establishments);  // For debugging purposes
    });
  }

  // Handle form submission to create a new establishment
  handleCreate() {
    if (this.schoolName && this.address && this.phone && this.email) {
      const newEstablishment = {
        name: this.schoolName,
        address: this.address,
        phone: this.phone,
        email: this.email,
      };

      // Call the service to create the establishment
      this.establishmentService.createEstablishment(newEstablishment).subscribe((createdEstablishment) => {
        this.establishments.push(createdEstablishment);
        this.clearForm();
      });
    } else {
      alert('Please fill in all fields');
    }
  }

  // Clear form and reset the selected establishment ID
  clearForm() {
    this.schoolName = '';
    this.address = '';
    this.phone = '';
    this.email = '';
    this.selectedEstablishmentId = null;  // Reset ID after creating or updating
  }

  // Handle selecting an establishment for updating
  handleUpdate(id: number) {
    const establishmentToUpdate = this.establishments.find((e) => e.id === id);
    if (establishmentToUpdate) {
      this.schoolName = establishmentToUpdate.name;
      this.address = establishmentToUpdate.address;
      this.phone = establishmentToUpdate.phone;
      this.email = establishmentToUpdate.email;
      this.selectedEstablishmentId = id;  // Set the selected ID to be updated
    }
  }

  // Handle updating an establishment
  saveUpdatedEstablishment() {
    if (this.selectedEstablishmentId !== null) {
      const updatedEstablishment = {
        name: this.schoolName,
        address: this.address,
        phone: this.phone,
        email: this.email,
      };

      this.establishmentService.updateEstablishment(this.selectedEstablishmentId, updatedEstablishment)
        .subscribe((updated) => {
          const index = this.establishments.findIndex(e => e.id === this.selectedEstablishmentId);
          if (index !== -1) {
            this.establishments[index] = updated;
          }
          this.clearForm();
        });
    }
  }

  // Handle deleting an establishment
  handleDelete(id: number) {
    this.establishmentService.deleteEstablishment(id).subscribe(() => {
      this.establishments = this.establishments.filter((e) => e.id !== id);
    });
  }
}

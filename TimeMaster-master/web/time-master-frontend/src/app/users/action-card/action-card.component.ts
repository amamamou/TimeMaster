import { Component, Input } from '@angular/core';

@Component({
  selector: 'app-action-card',
  templateUrl: './action-card.component.html',
  styleUrls: ['./action-card.component.css']
})
export class ActionCardComponent {
  @Input() title!: string;
  @Input() imgUrl!: string;
}

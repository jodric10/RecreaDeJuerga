import { Component, inject, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ToastService } from '../../services/toastMessage/toast.service';
import { ToastMessage } from '../../models/toastMessage/toastMessage';
import { FooterComponent } from '../../components/footer/footer.component';
import { EquipoService } from '../../services/equipo/equipo.service';
import { ContadorComponent } from '../../components/contador/contador.component';

@Component({
  selector: 'app-home',
  standalone:true,
  imports: [FooterComponent, ContadorComponent],
  templateUrl: './home.component.html',
  styleUrl: './home.component.css',
})
export class HomeComponent {
 
}

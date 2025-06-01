import { Component, CUSTOM_ELEMENTS_SCHEMA, OnInit } from '@angular/core';
import { Router, RouterLink } from '@angular/router';
import { AuthService } from '../../services/auth/auth.service';
import { take } from 'rxjs';
import { NgClass } from '@angular/common';

@Component({
  selector: 'app-menu',
  standalone: true,
  imports: [RouterLink,NgClass],
  templateUrl: './menu.component.html',
  styleUrl: './menu.component.css',
})
export class MenuComponent implements OnInit {
  admin: boolean = false;

  constructor(private authService: AuthService, public router: Router) {}

  ngOnInit(): void {
    this.authService.isLoggedIn$.pipe(take(1)).subscribe((data) => {
      this.admin = data;
    });
  }
}

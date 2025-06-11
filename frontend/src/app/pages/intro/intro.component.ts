import { Component, HostListener } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-intro',
  imports: [],
  templateUrl: './intro.component.html',
  styleUrl: './intro.component.css',
})
export class IntroComponent {
  transformStyle = 'scale(1)';
  hideArcade = false;

  constructor(private router: Router) {}

  @HostListener('window:scroll', [])
  onScroll(): void {
    const scrollY = window.scrollY;
    const scale = Math.min(3.2, 1 + scrollY / 300);
    this.transformStyle = `scale(${scale})`;

    if (scrollY > 600 && !this.hideArcade) {
      this.hideArcade = true;
      setTimeout(() => {
        this.router.navigate(['/app']).then(() => {
          window.scrollTo({ top: 0, behavior: 'smooth' });
        });
      }, 300);
    }
  }
}

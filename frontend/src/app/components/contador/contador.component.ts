import { Component, OnInit, OnDestroy } from '@angular/core';

@Component({
  selector: 'app-contador',
  templateUrl: './contador.component.html',
  styleUrls: ['./contador.component.css']
})
export class ContadorComponent implements OnInit, OnDestroy {
  targetDate: Date = new Date('2025-06-08T19:00:00');
  intervalId: any;

  days: number = 0;
  hours: number = 0;
  minutes: number = 0;
  seconds: number = 0;
  eventStarted: boolean = false;

  flip = {
    days: false,
    hours: false,
    minutes: false,
    seconds: false
  };

  prev = {
    days: 0,
    hours: 0,
    minutes: 0,
    seconds: 0
  };

  ngOnInit(): void {
    this.updateCountdown();
    this.intervalId = setInterval(() => this.updateCountdown(), 1000);
  }

  ngOnDestroy(): void {
    clearInterval(this.intervalId);
  }

  updateCountdown(): void {
    const now = new Date().getTime();
    const distance = this.targetDate.getTime() - now;

    if (distance <= 0) {
      clearInterval(this.intervalId);
      this.days = this.hours = this.minutes = this.seconds = 0;
      this.eventStarted = true;
      return;
    }

    const newDays = Math.floor(distance / (1000 * 60 * 60 * 24));
    const newHours = Math.floor((distance / (1000 * 60 * 60)) % 24);
    const newMinutes = Math.floor((distance / (1000 * 60)) % 60);
    const newSeconds = Math.floor((distance / 1000) % 60);

    this.animateIfChanged('days', newDays);
    this.animateIfChanged('hours', newHours);
    this.animateIfChanged('minutes', newMinutes);
    this.animateIfChanged('seconds', newSeconds);
  }

  animateIfChanged(unit: 'days' | 'hours' | 'minutes' | 'seconds', newValue: number): void {
    if (this[unit] !== newValue) {
      this.flip[unit] = true;
      setTimeout(() => (this.flip[unit] = false), 500);
      this[unit] = newValue;
    }
  }
}

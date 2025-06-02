import { HttpClient, HttpResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject, map, Observable, tap } from 'rxjs';
import { LoginRequest } from '../../models/Auth/LoginRequest';
import { AuthResponse } from '../../models/Auth/AuthResponse';
import { RegisterRequest } from '../../models/Auth/RegisterRequest';


@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private readonly api_url = 'http://localhost:8080/auth';
  private isLoggedIn: BehaviorSubject<boolean>= new BehaviorSubject<boolean>(false);
  public isLoggedIn$: Observable<boolean>= this.isLoggedIn.asObservable();

  constructor( private http: HttpClient) {
    if(this.getToken()!=null){
      this.isLoggedIn.next(true);
    }
   }

   loginUser(login: LoginRequest): Observable<AuthResponse> {
      return this.http.post<AuthResponse>(`${this.api_url}/login`,login)
      .pipe(
        tap((response: AuthResponse)=>{
          localStorage.setItem('token', response.token);
          this.isLoggedIn.next(true)
   })
      );
   }

   registerUser(register: RegisterRequest): Observable<AuthResponse>{
      return this.http.post<AuthResponse>(`${this.api_url}/register`,register)
      .pipe(
        tap(()=>this.isLoggedIn.next(true))
      );
   }

   getToken(){
      return localStorage.getItem('token');
   }
}

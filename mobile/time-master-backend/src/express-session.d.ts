/* eslint-disable prettier/prettier */
import 'express-session';

declare module 'express-session' {
  interface SessionData {
    user: any; // You can replace 'any' with a more specific type if you have one for the user
  }
}
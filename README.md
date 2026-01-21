Movie Explorer App

A Flutter app to explore movies, view details, and book tickets with a barcode-based ticket system.

Features

Onboarding Screens – Introductory walkthrough with images and Next/Get Started buttons.

Home Screen –

Search bar over a background image

Genre chips and a carousel slider of movies

Horizontal scrollable lists for popular and top-rated movies

Movie Details Screen –

Movie poster with “Watch Trailer” button

Like & Share buttons

Genres, description, info chips (year, duration, IMDb rating)

Date & time selection and a “Book Now” button

Booking Screen –

Ticket-style card with clipped edges

Movie poster and title inside the card

Booking details (date, time, row, seat)

Barcode for ticket verification

Bottom Navigation – Home, Find, Saved, Profile

API Integration –

Fetch movies list from server

Book tickets using API

API Service

Running the App

Clone the repo

Run flutter pub get

Update ApiService.baseUrl with your server URL

Run the app:

flutter run
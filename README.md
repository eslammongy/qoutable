# QuoteAll App

The Quotable App is a simple application designed to manage and display random or specific quotes from a set database or an API. It provides users with a clean interface to fetch, display, and save quotes while allowing customization through various features such as gradient background and font format changes.

## Getting Started

1. Clone the repository: `git clone https://github.com/eslammongy/quotable.git`
2. Navigate to the project directory: `cd project-name`
3. Install dependencies: `flutter pub get`
4. Run the app: `flutter run`

## Features

1. Fetch Random Quotes: The app fetches and displays random quotes from an API or a pre-defined list.
2. Display Quote Categories: It allows users to fetch and display quotes by different categories.
3. Fetch Quotes by Author: Users can search for quotes by a specific author and display all their relevant quotes.
4. Save Quotes Locally: The app provides functionality to save quotes locally for offline access.
5. Background Customization: Users can change the background design for the quote display box.
6. Quote Format Customization: Modify the visual format of quotes, such as font and text alignment.
7. Output Quotes as Images or Text: Users can export and share quotes as images or simple text.
8. Save Quotes as PNG: Allows saving quotes as PNG image files.
9. Switch between a light theme and a dark theme

## Key Dependencies Breakdown

- cached_network_image: For fetching and caching images of authors or quote backgrounds.
- dio: A powerful HTTP client for handling API requests.
- flutter_bloc: For managing state in the app using the BLoC (Business Logic Component) pattern.
- get_it: A service locator for dependency injection.
- go_router: This is for seamless navigation within the app.
- objectbox: This is for local database management to store quotes.
- shared_preferences: To store user preferences locally, such as favorite quotes or settings.
- share_plus: Enables sharing quotes via different platforms.

## Upcoming Features:
- Search by author or category.
- Translate quotes into any language.
- Add quotes as a native home widget.
- Expand quote categories.


## Requirements

- Flutter SDK version 2.0.0 or higher
- Dart SDK version 2.12.0 or higher

## Demo

## Screenshots

<p align="center">
    <img src="https://github.com/user-attachments/assets/aa308a0b-2263-4fcb-a803-5a7f34f2db9d" alt="Image 1" width="30%" />
  <img src="https://github.com/user-attachments/assets/ce12af64-170b-4094-b0de-ecbfc2f58597" alt="Image 2" width="30%" />
  <img src="https://github.com/user-attachments/assets/aa308a0b-2263-4fcb-a803-5a7f34f2db9d" alt="Image 3" width="30%" />
  </p>
<p align="center">
    <img src="https://github.com/user-attachments/assets/ce12af64-170b-4094-b0de-ecbfc2f58597" alt="Image 1" width="30%" />
  <img src="https://github.com/user-attachments/assets/0a929132-5ba0-40e9-9481-e91855d8f65a" alt="Image 2" width="30%" />
  <img src="https://github.com/user-attachments/assets/ce4ef5ff-3d46-4933-b02d-f04e1a5e783d" alt="Image 3" width="30%" />
  </p>
<p align="center">
    <img src="https://github.com/user-attachments/assets/a5c12d16-1237-4716-9252-47c75299e12f" alt="Image 1" width="30%" />
  <img src="https://github.com/user-attachments/assets/47991549-4746-4852-9124-ac3d178a04c0" alt="Image 2" width="30%" />
  <img src="https://github.com/user-attachments/assets/63383a1f-48e5-477a-86f9-9496cd49bc86" alt="Image 3" width="30%" />
  </p>


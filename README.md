# Blog Explorer

## A Feature-Rich Blog Browsing App

Welcome to the Blog Explorer app! This project offers a comprehensive solution for browsing, reading, and managing blog posts. Below you’ll find detailed documentation to help you set up, understand, and contribute to this project.

## Table of Contents

1. [Project Overview](#project-overview)
2. [Features](#features)
3. [Screenshots](#screenshots)
4. [Setup Instructions](#setup-instructions)
5. [Assumptions and Decisions](#assumptions-and-decisions)

---

### Project Overview

Blog Explorer is a mobile application built with Flutter, designed to provide users with an intuitive platform to explore, read, and manage blog content. It features a clean and user-friendly interface with three main screens:

- **Blog List Screen**: Displays a list of blogs fetched from an API, with titles and associated images.
- **Blog Detail Screen**: Shows full details of a selected blog, including its title and image.
- **Favorite Blogs Screen**: Allows users to manage their favorite blogs in a dedicated view.

### Features

#### Blog List Screen
- **API Integration**: Fetch blog data from a remote API using Flutter’s HTTP package.
- **Blog Item Display**: Each blog item shows the blog's title and an associated image.
- **Navigation to Detail View**: Tapping on a blog item navigates the user to a detailed view of the selected blog.

#### Blog Detail Screen
- **Detailed Blog Information**: View the full details of a blog, including title, image, and content.
- **Favorite Marking**: Users can mark a blog as a favorite, which will be saved and reflected in the Favorite Blogs Screen.

#### Favorite Blogs Screen
- **Manage Favorites**: Users can view and manage their favorite blogs in a dedicated screen.
- **Remove from Favorites**: Option to remove blogs from the favorites list.

### Additional Features
- **State Management**: Efficient state management using the `Bloc` library.
- **Error Handling**: Graceful handling of API errors with user-friendly messages.
- **Dark and Light Modes**: Supports both dark and light themes to enhance user experience.
- **Offline Mode**: Supports offline browsing using local storage (Hive).

### Screenshots

https://github.com/user-attachments/assets/8bd3ec37-f981-4d8b-9d3c-bbdcf1106686

#### Blog List Screen

![Screenshot_20240808-170351](https://github.com/user-attachments/assets/87991294-d979-46a8-86b3-f8631bead7af)

![Screenshot_20240808-170409](https://github.com/user-attachments/assets/ae9ade20-7a9c-4baa-846f-103b418b1fca)

#### Blog Detail Screen

![Screenshot_20240808-170359](https://github.com/user-attachments/assets/ff2e7a99-cb49-42bd-9cfd-72ed9561a4ed)

![Screenshot_20240808-170413](https://github.com/user-attachments/assets/2436d493-af0e-4c3e-955c-9e054d411f4a)

#### Favourite Blog Screen

![Screenshot_20240808-170405](https://github.com/user-attachments/assets/46b45b00-d2ee-4ec0-beee-0273c9ab0709)

![Screenshot_20240808-170415](https://github.com/user-attachments/assets/ed0a47f6-5d0d-4aa1-b1b3-19ce7e8811de)


### Setup Instructions

To get started with the Mini Home Automation App, follow these steps:

1. **Clone the Repository**
   ```bash
   git clone https://github.com/sahuharshit408/Blog-Explorer.git
   ```

2. **Navigate to the Project Directory**
   ```bash
   cd blog-explorer
   ```

3. **Install Dependencies**
   Ensure you have Flutter installed. Then, run the following command to install the required dependencies:
   ```bash
   flutter pub get
   ```

4. **Run the App**
   To run the app on an emulator or connected device, use:
   ```bash
   flutter run
   ```

5. **Build the App**
   To build the app for release, use:
   ```bash
   flutter build apk
   ```
   or for iOS:
   ```bash
   flutter build ios
   ```

### Assumptions and Decisions

- **Flutter Framework**: The app is built using Flutter to provide a cross-platform experience with a single codebase.
- **API Integration**: The app fetches blog data from a remote API, and the code is provided to handle API requests efficiently.
- **State Management**: `Bloc` is used for state management to maintain app responsiveness and performance.
- **Error Handling**: Implemented robust error handling to manage scenarios where the API is unavailable or returns an error.
- **User Interface Design**: The UI/UX design focuses on a clean and simple interface, ensuring an engaging user experience.

Thank you for exploring the Blog Explorer app! We hope you find it useful and welcome any feedback or contributions.


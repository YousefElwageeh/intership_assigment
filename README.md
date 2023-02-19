# Project Title

Brief description of the project

## Table of Contents

- [Design Pattern](#design-pattern)
- [State Management](#state-management)
- [Getting Started](#getting-started)
- [Folder Structure](#folder-structure)
- [Contributing](#contributing)
- [License](#license)

## Design Pattern

This project follows the principles of Clean Architecture, which separates the code into different layers, making it more modular, scalable, and testable. The layers used in this project are:

- Presentation: contains the UI code and is responsible for displaying the data to the user.
- Domain: contains the business logic and defines the use cases.
- Data: contains the implementation of the interfaces defined in the domain layer and is responsible for fetching and storing data.

## State Management

The state management is handled by GetX, a lightweight library that provides a powerful yet simple way to manage the state of a Flutter application. It uses reactive programming to update the UI whenever the data changes, making it easy to keep the app in sync with the backend.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

1. Clone the repository

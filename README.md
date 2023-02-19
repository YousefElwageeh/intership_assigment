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
This project follows the MVVM (Model-View-ViewModel) design pattern.

## Clean Architecture
This project follows the Clean Architecture approach with the following layers:
- **Core**: Contains interfaces and classes that are used across the project, such as repositories, use cases, and entities.
- **Config**: Contains configuration files for the project, such as theme, localization, and dependencies.
- **Features**: Contains the application features, each with its own domain, data, and presentation layers.

## State Management
This project uses the GetX package for state management, which provides a simple and powerful way to manage state, dependency injection, and navigation.

## Folder Structure
This project has the following folder structure:
- **lib**
  - **core**: Contains interfaces and classes that are used across the project.
    - **entities**: Contains the domain models.
    - **repositories**: Contains the repository interfaces.
    - **usecases**: Contains the use case interfaces.
  - **config**: Contains configuration files for the project.
    - **dependencies**: Contains the dependency injection files.
    - **localization**: Contains the localization files.
    - **routes**: Contains the routing configuration.
    - **theme**: Contains the theme configuration.
  - **features**: Contains the application features, each with its own domain, data, and presentation layers.
    - **feature_name**
      - **data**: Contains the implementation of the repository interfaces.
        - **datasources**: Contains the data sources for the repository.
        - **models**: Contains the data models.
        - **repositories_impl**: Contains the implementation of the repository interface.
      - **domain**: Contains the implementation of the use case interfaces.
        - **entities**: Contains the domain models.
        - **repositories**: Contains the repository interfaces.
        - **usecases**: Contains the implementation of the use case interfaces.
      - **presentation**: Contains the implementation of the UI.
        - **pages**: Contains the feature pages.
        - **widgets**: Contains the feature widgets.

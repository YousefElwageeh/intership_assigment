# internship assignment


Brief description of the project

## Table of Contents

- [Design Pattern](#architectural-pattern)
- [State Management](#state-management)
- [Folder Structure](#folder-structure)


## Clean Architecture
This project follows the Clean Architecture approach with the following layers:
- **data**: Contains interfaces and classes that are used across the project, such as repositories, use cases, and entities.
- **domin**: Contains the implementation of the use case interfaces.
- **Features**: Contains the application features, each with its own domain, data, and presentation layers.

## State Management
This project uses the GetX package for state management, which provides a simple and powerful way to manage state, dependency injection, and navigation.

## Folder Structure
This project has the following folder structure:
- **lib**
  - **core**: Contains interfaces and classes that are used across the project.
    - **theme**: Contains the theme .
    - **appstates**: Contains the app states such as loading state and sucess state.
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
        - **repositories**: Contains the repository interfaces.
      - **presentation**: Contains the implementation of the UI.
        - **ViewModel**: Contains the busniess logic.
        - **pages**: Contains the feature pages.
        - **widgets**: Contains the feature widgets.

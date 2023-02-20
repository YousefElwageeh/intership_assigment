# internship assignment


Brief description of the project

## Table of Contents

- [Backend](#Backend)
- [Architectural Pattern](#architectural-pattern)
- [State Management](#state-management)
- [Folder Structure](#folder-structure)


## Backend
i am using firebase for this project

## Clean Architecture
This project follows the Clean Architecture approach with the following layers:
- **data layer**: This layer is responsible for providing and persisting data. It contains repositories, data sources, and mappers that interact with external systems, such as databases, APIs, or file systems
- 
- **domin layer**:This layer represents the business logic of the application. It defines the entities, use cases, and interfaces that encapsulate the application's core functionality.
- 
- **Presentation layer**: This layer is responsible for handling user input and output. It consists of UI components, such as views and widgets, and their corresponding controllers, presenters, or view models.

## State Management
This project uses the GetX package for state management, which provides a simple and powerful way to manage state, dependency injection, and navigation.

## Folder Structure
This project has the following folder structure:
- **lib**
- **src**
  - **core**: Contains interfaces and classes that are used across the project.
    - **appstates**: Contains the app states such as loading state and sucess state.
  - **config**: Contains configuration files for the project.
    - **theme**: Contains the theme .
    - **utils**: Contains the const values and strings ....
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

# Kite

Kite News App - A Flutter application for browsing and reading news articles.

## Flutter Version Manager

This project is built using Flutter. To manage different versions of Flutter, we use the `fvm` ([Flutter Version
Management](https://fvm.app/documentation/getting-started)) tool. This allows us to easily switch between different
versions of Flutter for different projects.

## Running the Project
1. **Change directory**:
   ```bash
   cd kite
   ```
2. **Install Dependencies**:
   ```bash
   fvm flutter pub get
   ```
3. **Run the App**:
   ```bash
   fvm flutter run
   ```

## Melos

This project uses [Melos](https://melos.invertase.dev/) as a task runner to simplify common development tasks. Melos is
configured directly in the `pubspec.yaml` file.

### Getting Started with Melos

1. Ensure Melos is activated globally:
   ```bash
   dart pub global activate melos
   ```

2. Run Melos scripts using:
   ```bash
   melos [script-name]
   ```

### Available Scripts

- **generate**: Generates code for the project using build_runner
  ```bash
  melos generate
  ```

## Project Structure

The project follows a feature-based organization with clear separation of concerns:

```
lib/
├── core/           # Core functionality and utilities
│   ├── app/        # App initialization and configuration
│   ├── data/       # Core data handling
│   └── theme/      # App theming
├── data/           # Data layer components
├── model/          # Data models
├── providers/      # State management providers
├── ui/             # UI components organized by feature
│   ├── feed/       # News feed feature
│   ├── splash/     # Splash screen
│   ├── story/      # Story detail feature
│   └── today_in_history/ # Historical events feature
└── main.dart       # Application entry point
```

## Architecture and Development Choices

### State Management

- Uses **Flutter Riverpod** for state management
- Implements FutureProvider for async data fetching
- Properly handles loading, error, and success states

### UI Architecture

- Feature-based organization with screens and widgets separated
- Clean separation between UI and business logic
- Responsive design with support for light and dark themes

### Data Handling

- JSON serialization using **json_serializable** for code generation
- Immutable data models with required parameters
- HTTP client for API communication

### Navigation

- Simple navigation using MaterialPageRoute

### Other Libraries and Tools

- **flutter_svg** for vector graphics
- **flutter_widget_from_html_core** for HTML rendering
- **http** package for network requests
- **timeago** for relative time formatting
- **shimmer** for loading effects
- **cached_network_image** for image caching

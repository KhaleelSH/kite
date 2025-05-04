# Kite

Kite News App

## Flutter Version Manager

This project is built using Flutter. To manage different versions of Flutter, we use the `fvm` (Flutter Version
Management) tool. This allows us to easily switch between different versions of Flutter for different projects.

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


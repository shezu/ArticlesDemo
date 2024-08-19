# NYTimes
# Article App

This repository contains an iOS application that fetches and displays a list of articles using the New York Times API. The app is built using the MVC architecture, and it follows modern best practices including the repository pattern, dependency injection, and async/await for networking.

## Features

- Fetches articles from the New York Times API using a repository pattern.
- Displays article details.
- Testable architecture with dependency injection.

## Requirements

- Xcode 14 or later
- iOS 15.0 or later
- Swift 5.6 or later

## Getting Started

1. **Clone the repository:**
    ```bash
       git clone https://github.com/shezu/ArticlesDemo.git
       cd ArticlesDemo
    ```
2. **Install Dependencies:**

    This project does not have external dependencies, but ensure you're using Xcode 14 or later.

3. **Open the project in Xcode:**

    ```bash
    Copy code
    open ArticlesDemo.xcodeproj
    ```bash

4. **Run the app:**

    Select the desired simulator or a connected device and press the Run button in Xcode or use the shortcut Cmd + R.

## Running Tests

This project includes unit tests that can be run directly within Xcode.

1. **Run Tests:**

    Press Cmd + U to run all tests.

2. **View Test Results:**

    Test results will be displayed in the Xcode Test Navigator.

## Generating Code Coverage Reports

Code coverage reports provide insight into which parts of your code are exercised by tests.

1. **Enable Code Coverage:**

    - Open your project in Xcode.
    - Go to Product > Scheme > Edit Scheme....
    - Select the Test action from the left pane.
    - Check the Gather coverage data option.

2. **Run Tests with Coverage:**

    - Press Cmd + U to run all tests with coverage enabled.

3. **View Coverage Reports:**

    - After tests complete, open the Report Navigator (Cmd + 9).
    - Select the latest test report.
    - Choose the Coverage tab to view which files and lines are covered.

## Additional Notes
The app uses the repository pattern to separate data access logic from the view controllers, promoting clean architecture and testability.
Network calls are performed asynchronously using Swift's modern async/await pattern.

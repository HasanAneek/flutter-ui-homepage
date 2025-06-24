# UI Design Task

This Flutter project is a UI implementation based on a design task. It features a home screen that dynamically loads and displays data from a set of REST APIs, including a slider, featured services, service categories, and a list of service providers.

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

- You need to have Flutter installed on your machine. For installation instructions, please refer to the [official Flutter documentation](https://flutter.dev/docs/get-started/install).

### Installation

1.  Clone the repository to your local machine:
    ```sh
    git clone https://github.com/HasanAneek/flutter-ui-homepage.git
    ```
2.  Navigate to the project directory:
    ```sh
    cd ui_design_task
    ```
3.  Install the required dependencies:
    ```sh
    flutter pub get
    ```
4.  Run the app on your preferred emulator or physical device:
    ```sh
    flutter run
    ```

## Implementation Notes

### Project Structure

The project follows a clean and organized architecture, separating concerns into different directories:

-   `lib/screens`: Contains the main screens of the application (e.g., `HomeScreen`).
-   `lib/widgets`: Holds reusable UI components used across different screens (e.g., `HomeSlider`, `FeaturedServices`, `ServiceCards`).
-   `lib/services`: Includes the `ApiService` class responsible for all network requests.
-   `lib/models`: (Currently unused) Intended for data models to provide strong typing for API responses.

### API Integration

The application dynamically fetches all its content from the following REST API endpoints:

-   **Slider List**: `https://prohandy.xgenious.com/api/v1/slider-lists`
-   **Featured Services**: `https://prohandy.xgenious.com/api/v1/service/featured`
-   **Categories**: `https://prohandy.xgenious.com/api/v1/categories`
-   **Provider List**: `https://prohandy.xgenious.com/api/v1/provider-lists`

All API calls are managed within the `ApiService` class. For better performance, the home screen fetches data from all necessary endpoints in parallel using `Future.wait`.

### State Management

The app uses a combination of `StatefulWidget` and `FutureBuilder` to manage its state:

-   **`FutureBuilder`**: Handles the asynchronous loading of data on the home screen, displaying a loading indicator while fetching and showing an error message if the fetch fails.
-   **`StatefulWidget`**: Used in components like the `HomeSlider` to manage local UI state, such as the current page index.

### Key Features & Bug Fixes

-   **Dynamic Home Screen**: The entire home screen is built dynamically from API data.
-   **Image Slider**: A `PageView` with page indicators displays promotional images at the top of the screen.
-   **Featured Services**: A horizontal `ListView` showcases featured services with their images, titles, providers, and prices.
-   **Service Categories**: A `GridView` displays service categories with icons and names.
-   **Service Providers**: A horizontal `ListView` shows a list of available service providers.
-   **Bug Fixes**:
    -   Resolved a critical `_TypeError` crash by correctly parsing the API response for service providers.
    -   Fixed a `RenderFlex overflow` UI error by adjusting the `childAspectRatio` in the `GridView` for service categories.

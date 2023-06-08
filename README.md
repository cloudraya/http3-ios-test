# HTTP/3 URLSession Implementation

This iOS project demonstrates the implementation of HTTP/3 using URLSession. It includes a storyboard UI with a refresh button to trigger a network call and update a UILabel with information about the HTTP protocol.

## Features

- Implements HTTP/3 using URLSession.
- Provides a UI interface with a refresh button.
- Displays HTTP protocol information on a UILabel.

## Prerequisites

- Xcode 12.5 or later
- iOS 11 or later

## Installation

1. Clone the repository or download the source code.
2. Open the project in Xcode.

## Usage

1. Open the project in Xcode.
2. Build and run the project on a simulator or device running iOS 14.5 or later.
3. The app will launch with a UI interface containing a refresh button and a UILabel.
4. Tap the refresh button to trigger a network call.
5. The app will fetch HTTP protocol information using HTTP/3 and update the UILabel accordingly.

## Configuration

The project already includes the necessary configuration for HTTP/3 implementation using URLSession. If you need to modify any settings, you can refer to the following files:

- `Main.storyboard`: Contains the UI design for the UIButton and UILabel to trigger and display network information.
- `ViewController.swift`: Contains the main logic for handling the refresh button action and making the network request.
- `Color.swift`: Additional UIColor extension to generate UIColor class using hexadecimal color.

## Dependencies

This project uses the built-in URLSession framework provided by iOS and does not require any external dependencies.

## Resources

- [URLSession - Apple Developer Documentation](https://developer.apple.com/documentation/foundation/urlsession)
- [ATS Configuration Basics - Apple Developer Documentation](https://developer.apple.com/documentation/security/preventing_insecure_network_connections)

## License

This project is licensed under the [MIT License](LICENSE).

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

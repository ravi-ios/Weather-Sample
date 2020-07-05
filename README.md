# WeatherForecast-iOS client application

##### System requirements

- Xcode: v11.5 later
- OS: iOS 13.0 later
- Supported devices: iPhone 10 or later
- Supported orientations: Portrait

Application has a single screen which includes

- Current weather info
- Hour by hour weather info which is scrollable horizontally
- Day by day weather info which is scrollable vertically

The application was architected with the best practices that are inspired by WWDC, Apple's documentation, and various knowledge-sharing conferences.

The main building blocks are

- Network layer
- User interface

Responsibilities are divided among them and they are self-explanatory.

Note: Some time "Location services" won't work on the iOS simulator which results in an empty screen.
Choosing a location on Xcode's debugging panel (bottom section of Xcode) may give better results, and it won't be a problem on a physical device.

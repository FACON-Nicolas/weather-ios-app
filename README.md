#  Weather iOS App

![](https://img.shields.io/badge/Release-v1.0-blueviolet)
![](https://img.shields.io/badge/Language-Swift-005255)
![](https://img.shields.io/badge/Libraries-SwiftUI-00cfff)
![](https://img.shields.io/badge/OS-iOS-9cf)
![](https://badges.frapsoft.com/os/v2/open-source.svg?v=103)

This project is my first application developped in swiftUI. This application calls an API on the web to get more details about the weather in the city you gave, for the moment, it is impossible to know the city you're when you're using the application, it will be added in the future.

<img src="https://raw.githubusercontent.com/FACON-Nicolas/FACON-Nicolas/main/resources/weather.png?raw=true" width="400">

# Summary

* **[Summary](#summary)**
* **[Credits](#credits)**
* **[API Call](#api-call)**
* **[Installation](#installation)**
* **[Version](#version)**

# Credits

* **[FACON Nicolas](github.com/FACON-Nicolas)** : Project Creator / Developper

# API Call

To get the datas about the weather, I realized an API call to the [wttr.in](wttr.in)'s website.
To realize this API, this is the program:

```swift
    func fetchJson(city: String) async {
        do {
            let (data, _) = try await URLSession.shared.data(from: URL(string: "https://wttr.in/\(city)?format=j1")!)
            let json = try JSONSerialization.jsonObject(with: data) as! Dictionary<String, AnyObject>
        } catch {
            print("error")
        }
    }
```

# Installation

```sh
git clone https://github.com/FACON-Nicolas/weather-ios-app
```

# Version

**1.0.0**: 2023-03-08

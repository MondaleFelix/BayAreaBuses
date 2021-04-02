# Bay Area Buses 🚌 🌉
![Screen Capture GIF](https://lh3.googleusercontent.com/pw/ACtC-3f05OgnIrLzyxfCljhI5LMfZTCdz2fVkhenbLj2p5GtG3qvqGMLpHkJ7gYMoT2u5xXbxhfd7uLVRU-VpjYl-WvuRYsY9Y1_IP-n96jY2uqmiDo-LYBDUFNlIHOXfonIhKyT2Zr7tcAVIDCeQGYY2Rk=w1080-h540-no?authuser=0)

### Description:
Bay Area Buses allows users to estimate their arrival to an entered location. After entering an address, Bay Area Buses displays the optimal bus route and live GPS locations of the buses. 

## Getting Started

### Prerequisites

* Xcode
* iOS 13 and above
* iOS device that can run applications or simulators 
* [Google Maps Developer Account](https://developers.google.com/maps/gmp-get-started)
* [511SFBay Developer Account](https://511.org/open-data/transit)

### Installing

1) Clone this repository   (Don't include the $. This symbol indicates that you need to write this command in the commandline in this repository):

```
$ git clone https://github.com/MondaleFelix/BayAreaBuses.git
```

2) Traverse into the this repository:

```
$ cd /path/to/file/BayAreaBuses/BayAreaBuses
```

3) Install Pods

```
$ pod install
```

4) Open the workspace File:

```
$ open BayAreaBuses.xcworkspace/
```

5) Create a Constants.swift file in the Utilites Folder. This file will store your credentials.

```
let apiKey = [GOOGLE APIKEY]
let busKey = [511 API KEY]
```

6) Create a [Google Developer Account](https://developers.google.com/maps/gmp-get-started) and retrieve your credientials

Make sure [Maps SDK for iOS](https://developers.google.com/maps/documentation/ios-sdk/overview) and [Directions API](https://developers.google.com/maps/documentation/directions/overview) is enabled

7) Create a [511SFBay Developer Account](https://511.org/open-data/transit) and retrieve your token


## Built With

* [Swift 5.4](https://developer.apple.com/swift/) - Programming Language
* [Xcode 12.3](https://developer.apple.com/xcode/) - IDE


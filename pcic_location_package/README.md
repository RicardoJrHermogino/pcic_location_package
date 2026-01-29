<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages). 
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder. 

```dart
const like = 'sample';
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.



# PCIC Location Package

A Flutter package containing Philippine location data (Provinces, Municipalities, and Barangays).

## Features

- Complete list of Philippine provinces
- Complete list of municipalities
- Complete list of barangays
- Easy filtering by province and municipality codes

## Installation

Add this to your package's `pubspec.yaml` file:
```yaml
dependencies:
  pcic_location_package: ^1.0.0
```

Then run:
```bash
flutter pub get
```

## Usage
```dart
import 'package:pcic_location_package/pcic_location_package.dart';

// Create an instance of LocationService
final locationService = LocationService();

// Load all provinces
List<Province> provinces = await locationService.loadProvinces();

// Load municipalities by province code
List<Municipality> municipalities = await locationService.getMunicipalitiesByProvince('1');

// Load barangays by municipality code
List<Barangay> barangays = await locationService.getBarangaysByMunicipality(1);

// Get specific province
Province? province = await locationService.getProvinceByCode('1');
```

## Example
```dart
import 'package:flutter/material.dart';
import 'package:pcic_location_package/pcic_location_package.dart';

class LocationDropdown extends StatefulWidget {
  @override
  _LocationDropdownState createState() => _LocationDropdownState();
}

class _LocationDropdownState extends State<LocationDropdown> {
  final LocationService _locationService = LocationService();
  List<Province>? provinces;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final data = await _locationService.loadProvinces();
    setState(() {
      provinces = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (provinces == null) return CircularProgressIndicator();
    
    return DropdownButton<Province>(
      items: provinces!.map((province) {
        return DropdownMenuItem(
          value: province,
          child: Text(province.provinceName),
        );
      }).toList(),
      onChanged: (value) {},
    );
  }
}
```

## License

This project is licensed under the MIT License.
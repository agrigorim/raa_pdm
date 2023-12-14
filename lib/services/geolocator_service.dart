import 'package:geolocator/geolocator.dart';
import 'package:geolocator_android/geolocator_android.dart';

late LocationSettings locationSettings;

if (defaultTargetPlatform == TargetPlatform.android) {
  locationSettings = AndroidSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
    forceLocationManager: true,
    intervalDuration: const Duration(seconds: 10),
  );
} else {
    locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );
}

StreamSubscription<Position> positionStream = Geolocator.getPositionStream(locationSettings: locationSettings).listen(
    (Position? position) {
        print(position == null ? 'Unknown' : '${position.latitude.toString()}, ${position.longitude.toString()}');
    });

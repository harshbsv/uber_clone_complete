import 'package:google_maps_flutter/google_maps_flutter.dart';

enum AppState {
  choosingLocation,
  confirmingFare,
  waitingForPickup,
  riding,
  postRide,
}

enum RideStatus {
  picking_up,
  riding,
  completed,
}

class Ride {
  final String id;
  final String driverId;
  final String passengerId;
  final int fare;
  final RideStatus status;

  Ride({
    required this.id,
    required this.driverId,
    required this.passengerId,
    required this.fare,
    required this.status,
  });

  factory Ride.fromJson(Map<String, dynamic> json) {
    return Ride(
      id: json['id'],
      driverId: json['driver_id'],
      passengerId: json['passenger_id'],
      fare: json['fare'],
      status: RideStatus.values
          .firstWhere((e) => e.toString().split('.').last == json['status']),
    );
  }
}

class Driver {
  final String id;
  final String model;
  final String number;
  final bool isAvailable;
  final LatLng location;

  Driver({
    required this.id,
    required this.model,
    required this.number,
    required this.isAvailable,
    required this.location,
  });

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      id: json['id'],
      model: json['model'],
      number: json['number'],
      isAvailable: json['is_available'],
      location: LatLng(json['latitude'], json['longitude']),
    );
  }
}

import 'package:google_maps_flutter/google_maps_flutter.dart';

class ProjectEntity {
  final String title;
  final List<String> images;
  final String costPrice;
  final String neighborPrice;
  final String meterPrice;
  final List<Map<String,dynamic>> buildingAmenities;
  final List<Map<String,dynamic>> areaAmenities;
  final LatLng location;
  final List<Map<String, dynamic>> timeline;
  final List<Map<String, dynamic>> paymentPlan;
  final List<dynamic> rawMaterials;
  final List<dynamic> clientRevenue;

  ProjectEntity({
    required this.title,
    required this.images,
    required this.costPrice,
    required this.neighborPrice,
    required this.meterPrice,
    required this.buildingAmenities,
    required this.areaAmenities,
    required this.location,
    required this.timeline,
    required this.paymentPlan,
    required this.rawMaterials,
    required this.clientRevenue,
  });

}


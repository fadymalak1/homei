import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../domain/entities/project_entity.dart';

class ProjectDetailsModel extends ProjectEntity {
  ProjectDetailsModel({
    required String title,
    required List<String> images,
    required String costPrice,
    required String neighborPrice,
    required String meterPrice,
    required List<Map<String,dynamic>> buildingAmenities,
    required List<Map<String,dynamic>> areaAmenities,
    required LatLng location,
    required List<Map<String,dynamic>> timeline,
    required List<Map<String, dynamic>> paymentPlan,
    required List<dynamic> rawMaterials,
    required List<dynamic> clientRevenue,
  }) : super(
    title: title,
    images: images,
    costPrice: costPrice,
    neighborPrice: neighborPrice,
    meterPrice: meterPrice,
    buildingAmenities: buildingAmenities,
    areaAmenities: areaAmenities,
    location: location,
    timeline: timeline,
    paymentPlan: paymentPlan,
    rawMaterials: rawMaterials,
    clientRevenue: clientRevenue,
  );

  factory ProjectDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProjectDetailsModel(
      title: json['title'],
      images: json['images'],
      costPrice: json['costPrice'],
      neighborPrice: json['neighborPrice'],
      meterPrice: json['meterPrice'],
      buildingAmenities: List<Map<String,dynamic>>.from(json['buildingAmenities']),
      areaAmenities: List<Map<String,dynamic>>.from(json['areaAmenities']),
      location: LatLng(json['latitude'], json['longitude']),
      timeline: List<Map<String,dynamic>>.from(json['timeline']),
      paymentPlan: List<Map<String, dynamic>>.from(json['paymentPlan']),
      rawMaterials: json['rawMaterials'],
      clientRevenue: json['clientRevenue'],
    );
  }
}

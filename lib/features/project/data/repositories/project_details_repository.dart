import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homei/core/utils/app_icons.dart';
import '../../../../core/utils/app_images.dart';
import '../../domain/entities/project_entity.dart';

class ProjectDetailsRepository {
  Future<ProjectEntity> getProject() async {
    try {
      // Mocked ProjectEntity data
      return ProjectEntity(
        title: "C167, Nrges, Fifth Settlement, New Cairo",
        images: [
          AppImages.banner1,
          AppImages.banner2,
          AppImages.banner3
        ],
        costPrice: '14,500 - 15,300',
        neighborPrice: "18,000 - 20,000",
        meterPrice: "18,000 / Year",
        buildingAmenities: [
          {
            "name": "Parking",
            "icon": AppIcons.parking
          },
          {
            "name": "Gym",
            "icon": AppIcons.gym
          },
          {
            "name": "Spa",
            "icon": AppIcons.spa
          },
          {
            "name": "Swimming Pool",
            "icon": AppIcons.pool
          },
        ],
        areaAmenities: [
          {
            "name": "Mosque",
            "icon": AppIcons.mosque
          },
          {
            "name": "University",
            "icon": AppIcons.university
          },
          {
            "name": "Hospital",
            "icon": AppIcons.hospital
          },
          {
            "name": "Bank",
            "icon": AppIcons.bank
          },
        ],
        location: LatLng(30.0444, 31.2357), // Example: Cairo, Egypt
        timeline: [
          {"title": "Grouping Stage", "date": "23/10/2024","isCompleted": true},
          {"title": "1st Floor Ceiling", "date": "23/11/2024","isCompleted": true,"images": [
            "https://firebasestorage.googleapis.com/v0/b/sprinto-d6797.appspot.com/o/homei%2FIMG-20240529-WA0008.jpg?alt=media&token=44c2b574-5520-4cf5-9b59-48dc9050002d",
            "https://firebasestorage.googleapis.com/v0/b/sprinto-d6797.appspot.com/o/homei%2FWhatsApp%20Image%202024-05-29%20at%2012.31.22%20PM%20(1)%20(1).jpeg?alt=media&token=ed68839d-987d-416a-9528-8fe140bce00f",
            "https://firebasestorage.googleapis.com/v0/b/sprinto-d6797.appspot.com/o/homei%2FWhatsApp%20Image%202024-05-29%20at%2012.31.22%20PM%20(1).jpeg?alt=media&token=f52975e1-5aca-4d88-8416-9a6bc07422bc",
            "https://firebasestorage.googleapis.com/v0/b/sprinto-d6797.appspot.com/o/homei%2Fimg-20240516-wa0003_720.jpg?alt=media&token=4d279495-d08e-4e37-80ec-c51a481d507a"
          ]},
          {"title": "2nd Floor Columns", "date": "12/12/2024","isCompleted": false},
          {"title": "2rd Floor Ceiling", "date": "23/12/2024", "isCompleted": false},
        ],
        paymentPlan: [
          {"title": "Down Payment", "time": "Instant", "amount": "50%"},
          {"title": "1st installment", "time": "After 3 months", "amount": "10%"},
          {"title": "2nd installment", "time": "After 6 months", "amount": "10%"},
          {"title": "3rd installment", "time": "After 9 months", "amount": "10%"},
          {"title": "4th installment", "time": "After 12 months", "amount": "10%"},
          {"title": "5th installment", "time": "After 15 months", "amount": "10%"},
        ],
        rawMaterials: ["Concrete", "Steel", "Glass"],
        clientRevenue: [
          {"name": "Projected ROI Q1", "value": "\$5,000"},
          {"name": "Projected ROI Q2", "value": "\$7,500"}
        ],
      );
    } catch (error) {
      // Handle errors appropriately
      throw Exception('Failed to fetch project data: $error');
    }
  }
}

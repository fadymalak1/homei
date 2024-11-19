import 'package:flutter/material.dart';
import '../../domain/entities/project_entity.dart';

class ProjectAmenities extends StatelessWidget {
  final ProjectEntity project;

  const ProjectAmenities({required this.project});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Building Amenities',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        SizedBox(
          height:40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>Chip(padding: EdgeInsets.all(5),label: Row(
                children: [
                  Image.asset(project.buildingAmenities[index]['icon'], height: 20, width: 20),
                  SizedBox(width: 5,),
                  Text(project.buildingAmenities[index]['name']),
                ],
              ),),
              separatorBuilder:  (context, index) => SizedBox(width: 10,),
              itemCount: project.buildingAmenities.length,
          ),
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            Text('Area Amenities', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
            SizedBox(width: 10,),
            Text('(Within 5KM)', style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12,color: Colors.grey)),
          ],
        ),
        SizedBox(
          height:40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>Chip(padding: EdgeInsets.all(5),label: Row(
              children: [
                Image.asset(project.areaAmenities[index]['icon'], height: 20, width: 20),
                SizedBox(width: 5,),
                Text(project.areaAmenities[index]['name']),
              ],
            ),),
            separatorBuilder:  (context, index) => SizedBox(width: 10,),
            itemCount: project.buildingAmenities.length,
          ),
        ),
      ],
    );
  }
}

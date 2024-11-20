import 'package:flutter/material.dart';
import 'package:homei/features/project_details/domain/entities/project_entity.dart';

class ProjectAreaSpecification extends StatelessWidget {
  final ProjectEntity project;
  const ProjectAreaSpecification({required this.project, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.grey.withOpacity(0.1),

      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Area Specifications", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          Row(
            children: [
              FittedBox(child: Text("Long term investment", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),)),
              SizedBox(width: 5,),
              Icon(Icons.info_outline, color: Colors.grey,size: 20,),
              Spacer(),
              FittedBox(child: Text("Short term investment", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),)),
              SizedBox(width: 5,),
              Icon(Icons.info_outline, color: Colors.grey,size: 20,),
            ],
          ),
          Text("The property spans 3,000 sq. ft. in total, with 2,500 sq. ft. of built-up space, complemented by a lush garden and a private terrace, offering both style and practicality.", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),maxLines: 4,overflow: TextOverflow.ellipsis,textAlign: TextAlign.start,),
        ],
      ),
    );
  }
}

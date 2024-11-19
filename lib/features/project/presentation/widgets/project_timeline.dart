import 'package:flutter/material.dart';
import 'package:galleryimage/galleryimage.dart';

class ProjectTimeline extends StatelessWidget {
  final List<Map<String, dynamic>> timeline;

  const ProjectTimeline({required this.timeline});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.grey.withOpacity(0.1),

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('HOMEi Timeline', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              SizedBox(width: 10,),
              Icon(Icons.info_outline, color: Colors.grey,size: 22,)
            ],
          ),
          SizedBox(height: 20),
          ...timeline.map((item) {
            int index = timeline.indexOf(item);
            return buildTimelineTile(
              isCompleted: item['isCompleted'],
              isLast: index == timeline.length - 1,
              title: item['title'],
              date: item['date'],
              images: item['images'],
            );
          }).toList(),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Spacer(),
            InkWell(
              onTap: () {

              },
              child: Row(
                children: [
                  Text('View All', style: TextStyle(color: Colors.grey),),
                  SizedBox(width: 5,),
                  Icon(Icons.arrow_forward_ios, color: Colors.grey,size: 15,),
                ],
              ),
            )
          ],)
        ],
      ),
    );

  }
}


Widget buildTimelineTile({
  required bool isCompleted,
  required String title,
  required String date,
  required bool isLast,
  List<String>? images,
}) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Icon(
                isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
                color: isCompleted ? Colors.orange : Colors.grey,
              ),
              isLast? SizedBox.shrink():images != null?Container(
                width: 2,
                height: 100,
                color: Colors.grey.shade400,
              ):Container(
                width: 2,
                height: 50,
                color: Colors.grey.shade400,
              ),
            ],
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  date,
                  style: TextStyle(color: Colors.grey),
                ),
                if (images != null) ...[
                  SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: GalleryImage(
                          showAppBar: false,
                          key: UniqueKey(),
                          imageUrls: images,
                          closeWhenSwipeDown: true,
                          closeWhenSwipeUp: true,
                          numOfShowImages: 3,
                          titleGallery: "Title",
                          childAspectRatio: 1.6,
                        )
                      ),

                ],
              ],
            ),
          ),
        ],
      ),
    ],
  );
}
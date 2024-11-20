import 'package:flutter/material.dart';
import '../../../../core/utils/app_images.dart';
import '../../domain/entities/project_entity.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProjectHeader extends StatefulWidget {
  final ProjectEntity project;

  const ProjectHeader({required this.project});

  @override
  _ProjectHeaderState createState() => _ProjectHeaderState();
}

class _ProjectHeaderState extends State<ProjectHeader> {
  // PageController for the sliding banner
  final PageController _pageController = PageController();
  int _currentPage = 0;


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image Section - Slider with indicator
        SizedBox(
          height: 280,
          child: Stack(
            children: [
              // PageView for image sliding
              PageView.builder(
                controller: _pageController,
                itemCount: widget.project.images.length,
                scrollDirection: Axis.horizontal,

                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    height: 280,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.project.images[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
              // Floating action buttons for quick actions
              Positioned(
                top: 10,
                left: 10,
                child: SafeArea(
                  child: FloatingActionButton(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    shape: CircleBorder(),
                    mini: true,
                    onPressed: () {},
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
              Positioned(
                top: 60,
                right: 10,
                child: SafeArea(
                  child: Column(
                    children: [

                      FloatingActionButton(
                        mini: true,
                        onPressed: () {},
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        shape: CircleBorder(),
                        child: Icon(Icons.location_pin),
                      ),
                      SizedBox(height: 10),
                      FloatingActionButton(
                        mini: true,
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        shape: CircleBorder(),
                        onPressed: () {},
                        child: Icon(Icons.chat),
                      ),
                      SizedBox(height: 10),
                      FloatingActionButton(
                        mini: true,
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        shape: CircleBorder(),
                        onPressed: () {},
                        child: Icon(Icons.share),
                      ),
                    ],
                  ),
                ),
              ),
              // Page indicator at the bottom
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: SafeArea(
                  child: Center(
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: widget.project.images.length,
                      effect: ExpandingDotsEffect(
                        dotWidth: 8.0,
                        dotHeight: 8.0,
                        expansionFactor: 4,
                        spacing: 5.0,
                        dotColor: Colors.white.withOpacity(0.5),
                        activeDotColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Details Section
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Text(
                  widget.project.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              // Property Info Tiles with dividers
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: PropertyInfoTile(
                        label: 'Cost Price',
                        value: widget.project.costPrice.toString(),
                      ),
                    ),
                    _buildDivider(),
                    Expanded(
                      child: PropertyInfoTile(
                        label: 'Neighbor Price',
                        value: widget.project.neighborPrice.toString(),
                      ),
                    ),
                    _buildDivider(),
                    Expanded(
                      child: PropertyInfoTile(
                        label: 'Meter Price',
                        value: widget.project.meterPrice.toString(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Custom method to build vertical divider with consistent styling
  Widget _buildDivider() {
    return VerticalDivider(
      color: Colors.orange, // Customize the color
      thickness: 1,       // Thickness of the line
      width: 5,           // Width of the space around the divider
      indent: 7,          // Empty space before the divider
      endIndent: 7,       // Empty space after the divider
    );
  }
}

class PropertyInfoTile extends StatelessWidget {
  final String label;
  final String value;

  const PropertyInfoTile({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FittedBox(
          child: Text(
            label,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        FittedBox(
          child: Text(
            value,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}

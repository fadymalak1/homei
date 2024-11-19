import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homei/features/project/presentation/controllers/product_details_controller.dart';
import 'package:homei/features/project/presentation/widgets/project_area_specification.dart';
import '../widgets/project_header.dart';
import '../widgets/project_amenities.dart';
import '../widgets/project_location.dart';
import '../widgets/project_timeline.dart';
import '../widgets/payment_plan.dart';
import '../widgets/raw_materials_chart.dart';
import '../widgets/client_revenue_chart.dart';

class ProjectDetailsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectState = ref.watch(projectDetailsControllerProvider);

    return Scaffold(
      body: projectState.when(
        data: (project) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProjectHeader(project: project),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProjectAmenities(project: project),
                    ProjectLocation(project: project),
                    SizedBox(height: 10,),
                    ProjectAreaSpecification(project: project),
                    SizedBox(height: 10,),
                    ProjectTimeline(timeline: project.timeline),
                    SizedBox(height: 10,),
                    PaymentPlan(paymentPlan: project.paymentPlan),
                    SizedBox(height: 10,),
                    const RawMaterialsChart(),
                    SizedBox(height: 10,),
                    const ClientRevenueChart(),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
      ),
    );
  }
}


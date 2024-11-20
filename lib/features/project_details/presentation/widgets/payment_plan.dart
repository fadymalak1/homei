import 'dart:developer';

import 'package:flutter/material.dart';

class PaymentPlan extends StatelessWidget {
  final List<Map<String, dynamic>> paymentPlan;

  const PaymentPlan({required this.paymentPlan});

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
          Text(
            "Payment plan",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Column(
            children: paymentPlan.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, dynamic> payment = entry.value; // Ensure the type matches
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      payment["amount"] ?? "",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  Column(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.orange,
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.orange,
                          ),
                        ),
                      ),
                      if (index != paymentPlan.length - 1)
                        Container(
                          width: 2,
                          height: 50,
                          color: Colors.orange,
                        ),
                    ],
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          payment["title"] ?? "",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          payment["time"] ?? "",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),

          ),
        ],
      ),
    );
  }
}

import 'package:an_trua_hinet/core/constants/constants.dart';
import 'package:an_trua_hinet/core/widgets/app_divider.dart';
import 'package:an_trua_hinet/core/widgets/meal_card.dart';
import 'package:flutter/material.dart';

class MealPage extends StatefulWidget {
  const MealPage({super.key});

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                key: ValueKey('titleRow'),
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Tổng số",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                  ),
                  Text(
                    "700.000VNĐ",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: colorBlue,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Column(
                    children: [MealCard(), if (index != 4) AppDivider()],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

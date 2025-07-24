import 'package:an_trua_hinet/core/constants/constants.dart';
import 'package:flutter/material.dart';

class MealCard extends StatelessWidget {
  const MealCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: colorSplash,
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        print("Click MealCard");
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: Row(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade300,
                ), // viền nhẹ màu xám nhạt
                borderRadius: BorderRadius.circular(8), // bo nhẹ góc nếu muốn
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  8,
                ), // cần để ảnh cũng bo giống container
                child: Image.asset(
                  'assets/images/bun_cha.jpg',
                  fit: BoxFit.cover, // đảm bảo ảnh lấp đầy và cắt đều
                ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Bún chả",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "70.000 VND",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: colorBlue,
                        ),
                      ),
                    ],
                  ),
                  Text("Ngày: 20/11/2025", style: TextStyle(color: colorGrey)),
                  Text("Thành viên: 4", style: TextStyle(color: colorGrey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

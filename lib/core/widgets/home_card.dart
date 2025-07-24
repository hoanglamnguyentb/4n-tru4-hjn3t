import 'package:an_trua_hinet/core/constants/constants.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const HomeCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: colorSplash,
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey, // nền trắng (hoặc bất kỳ)
              borderRadius: BorderRadius.circular(12), // bo góc
              boxShadow: [
                BoxShadow(
                  color: Colors.black12, // màu bóng đổ
                  blurRadius: 6, // độ mờ
                  offset: Offset(0, 3), // hướng đổ bóng
                ),
              ],
            ),
            child: Icon(icon),
          ),
          SizedBox(height: 2),
          Text(title, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

import 'package:an_trua_hinet/core/constants/constants.dart';
import 'package:an_trua_hinet/models/member.dart';
import 'package:flutter/material.dart';

class MemberCard extends StatelessWidget {
  final Member member;
  const MemberCard({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            member.avatarUrl ?? 'assets/images/avatar.png',
            height: 48,
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                member.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text("1.000.000đ", style: TextStyle(fontSize: 16)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorBlue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  minimumSize: Size(0, 0),
                ),
                onPressed: () {
                  // Xử lý khi nhấn
                  print("Đã nhấn nút");
                },
                child: Text("Thông tin"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:an_trua_hinet/core/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Hàng 1
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.asset('assets/images/burger.png', height: 24),
                  Spacer(),
                  Icon(Icons.search),
                  SizedBox(width: 4),
                  Icon(Icons.notifications),
                  SizedBox(width: 4),
                  Icon(Icons.menu),
                ],
              ),
            ),
            // Hàng 2
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/avatar.png', height: 48),
                  SizedBox(width: 8),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        color: Colors.grey.withOpacity(0.2),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("Tổng số dứ"),
                                  Icon(Icons.chevron_right),
                                  Spacer(),
                                  Icon(Icons.remove_red_eye),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "*** ***",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16, // kích thước chính
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    "VNĐ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Hàng 3
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: HomeCard(
                      title: "Danh sách bữa ăn",
                      icon: Icons.list_alt,
                      onTap: () {},
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: HomeCard(
                      title: "Thêm bữa ăn mới",
                      icon: Icons.add_circle_outline,
                      onTap: () {},
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: HomeCard(
                      title: "Thành viên nhóm",
                      icon: Icons.group,
                      onTap: () {
                        context.go('/member');
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: HomeCard(
                      title: "Tổng kết nợ",
                      icon: Icons.receipt_long,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
            Text("Khối 4"),
          ],
        ),
      ),
    );
  }
}

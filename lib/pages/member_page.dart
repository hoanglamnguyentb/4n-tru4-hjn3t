import 'package:an_trua_hinet/core/widgets/member_card.dart';
import 'package:an_trua_hinet/models/member.dart';
import 'package:an_trua_hinet/services/member_service.dart';
import 'package:flutter/material.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({super.key});

  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  List<Member> members = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    _loadMembers();
  }

  Future<void> _loadMembers() async {
    try {
      final data = await MemberService.getMembers();
      setState(() {
        members = data;
        isLoading = false;
      });
    } catch (e) {
      print("Lỗi khi load members: $e");
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Thành viên nhóm",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  Icon(Icons.search, size: 24),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: members.length,
                itemBuilder: (context, index) {
                  final member = members[index];
                  return MemberCard(member: member);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

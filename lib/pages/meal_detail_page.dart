import 'package:an_trua_hinet/core/constants/constants.dart';
import 'package:an_trua_hinet/core/utils/formatters.dart';
import 'package:an_trua_hinet/core/widgets/meal_detail_member_card.dart';
import 'package:an_trua_hinet/models/meal.dart';
import 'package:an_trua_hinet/models/member.dart';
import 'package:an_trua_hinet/services/meal_service.dart';
import 'package:flutter/material.dart';

class MealDetailPage extends StatefulWidget {
  final Meal meal;

  const MealDetailPage({super.key, required this.meal});

  @override
  State<MealDetailPage> createState() => _MealDetailPageState();
}

class _MealDetailPageState extends State<MealDetailPage> {
  Future<void> _showAddMemberDialog() async {
    final selected = await showDialog<List<Member>>(
      context: context,
      builder: (context) {
        final selectedMembers = <Member>{};

        return AlertDialog(
          title: const Text("Thêm thành viên"),
          content: FutureBuilder<List<Member>>(
            future: MealService.getAvailableMembersForMeal(widget.meal.id),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const CircularProgressIndicator();
              final members = snapshot.data!;
              return StatefulBuilder(
                builder: (context, setState) {
                  return SizedBox(
                    width: double.maxFinite,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: members.map((m) {
                          return CheckboxListTile(
                            value: selectedMembers.contains(m),
                            onChanged: (val) {
                              setState(() {
                                val == true
                                    ? selectedMembers.add(m)
                                    : selectedMembers.remove(m);
                              });
                            },
                            title: Text(m.name),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, null),
              child: const Text("Hủy"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, selectedMembers.toList()),
              child: const Text("Thêm"),
            ),
          ],
        );
      },
    );

    if (selected != null && selected.isNotEmpty) {
      await MealService.addMembersToMeal(widget.meal.id, selected);

      // Cập nhật lại participants trong meal
      setState(() {
        widget.meal.participants.addAll(selected);
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Đã thêm thành viên")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final meal = widget.meal;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text(
            "Chi tiết bữa ăn",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 128,
                    height: 128,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/bun_cha.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          meal.note ?? "Bữa ăn",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Tổng thanh toán: ${currencyFormat.format(meal.amount)}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: colorBlue,
                          ),
                        ),
                        Text(
                          "Ngày: ${dateFormat.format(meal.date)}",
                          style: const TextStyle(color: colorGrey),
                        ),
                        Text(
                          "Thành viên: ${meal.participants.length}",
                          style: const TextStyle(color: colorGrey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ...meal.participants.map(
                (member) => MealDetailMemberCard(member: member),
              ),
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: meal.participants.length,
              //     itemBuilder: (context, index) {
              //       final member = meal.participants[index];
              //       return MealDetailMemberCard(member: member);
              //     },
              //   ),
              // ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _showAddMemberDialog,
          child: const Icon(Icons.person_add),
        ),
      ),
    );
  }
}

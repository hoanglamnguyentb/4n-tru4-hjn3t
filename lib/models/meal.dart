import 'package:an_trua_hinet/models/member.dart';

class Meal {
  final String id;
  final DateTime date;
  final String payerId;
  final double amount;
  final String? note;
  final DateTime createdAt;
  final Member? payer;
  final List<Member> participants;

  Meal({
    required this.id,
    required this.date,
    required this.payerId,
    required this.amount,
    this.note,
    required this.createdAt,
    this.payer,
    this.participants = const [],
  });

  /// Tạo Meal từ Supabase Map
  factory Meal.fromMap(Map<String, dynamic> map) {
    // map['payer'] là một Map chứa thông tin người trả tiền
    final payerMap = map['payer'] as Map<String, dynamic>?;

    // map['meal_members'] là một List, mỗi phần tử là Map chứa key 'member'
    final participantsData = map['meal_members'] as List<dynamic>?;

    return Meal(
      id: map['id'] as String,
      date: DateTime.parse(map['date'] as String),
      payerId: map['payer_id'] as String,
      amount: (map['amount'] as num).toDouble(),
      note: map['note'] as String?,
      createdAt: DateTime.parse(map['created_at'] as String),
      payer: payerMap != null ? Member.fromMap(payerMap) : null,
      participants: participantsData != null
          ? participantsData.map((e) => Member.fromMap(e['member'])).toList()
          : [],
    );
  }

  /// Convert ngược lại sang Supabase map (nếu cần insert)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'payer_id': payerId,
      'amount': amount,
      'note': note,
      'created_at': createdAt.toIso8601String(),
    };
  }
}

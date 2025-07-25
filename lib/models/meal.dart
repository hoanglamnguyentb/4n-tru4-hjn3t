class Meal {
  final String id;
  final DateTime date;
  final String payerId;
  final double amount;
  final String? note;
  final DateTime createdAt;

  Meal({
    required this.id,
    required this.date,
    required this.payerId,
    required this.amount,
    this.note,
    required this.createdAt,
  });

  /// Tạo Meal từ Supabase Map
  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      id: map['id'] as String,
      date: DateTime.parse(map['date'] as String),
      payerId: map['payer_id'] as String,
      amount: (map['amount'] as num).toDouble(),
      note: map['note'] as String?,
      createdAt: DateTime.parse(map['created_at'] as String),
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

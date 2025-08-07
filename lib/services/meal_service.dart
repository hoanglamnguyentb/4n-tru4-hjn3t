import 'package:an_trua_hinet/models/meal.dart';
import 'package:an_trua_hinet/models/member.dart';
import 'package:an_trua_hinet/services/member_service.dart';
import 'package:an_trua_hinet/services/supabase_client.dart';

class MealService {
  static final _client = SupabaseService.client;
  static const _tableName = 'meals';

  static Future<List<Meal>> getAllMeals() async {
    final response = await _client.from(_tableName).select();
    final data = response as List;
    return data.map((e) => Meal.fromMap(e)).toList();
  }

  static Future<List<Meal>> fetchMealsPaginated(int from, int to) async {
    final response = await _client
        .from(_tableName)
        .select('''
          *,
          payer:members!meals_payer_id_fkey(id, name),
          meal_members (
            member:members (id, name)
          )
        ''')
        .order('date', ascending: false)
        .range(from, to);

    if (response is List) {
      return response.map((e) => Meal.fromMap(e)).toList();
    } else {
      throw Exception("Lỗi phân trang bữa ăn: $response");
    }
  }

  static Future<void> addMeal(Meal meal) async {
    final insertData = meal.toMap();
    await _client.from(_tableName).insert(insertData);
  }

  static Future<void> deleteMeal(String id) async {
    await _client.from(_tableName).delete().eq('id', id);
  }

  static Future<void> updateMeal(Meal meal) async {
    final updateData = meal.toMap();
    await _client.from(_tableName).update(updateData).eq('id', meal.id);
  }

  static Future<double> getTotalAmount() async {
    final result = await _client.from(_tableName).select('amount').execute();

    final data = result.data as List;

    if (data.isEmpty) return 0;
    return data.fold<double>(0, (sum, e) {
      final value = (e['amount'] ?? 0);
      return sum + (value is double ? value.toDouble() : value);
    });
  }

  static Future<List<Member>> getAvailableMembersForMeal(String mealId) async {
    final allMembers = await MemberService.getMembers();
    final joined =
        await _client
                .from('meal_members')
                .select('member_id')
                .eq('meal_id', mealId)
            as List;
    final joinedIds = joined.map((e) => e['member_id']).toSet();

    return allMembers.where((m) => !joinedIds.contains(m.id)).toList();
  }

  static Future<void> addMembersToMeal(
    String mealId,
    List<Member> members,
  ) async {
    final inserts = members
        .map(
          (m) => {
            'meal_id': mealId,
            'member_id': m.id,
            'amount': 0,
            'is_paid': false,
          },
        )
        .toList();

    final response = await _client.from('meal_members').insert(inserts);

    if (response.error != null) {
      throw Exception("Lỗi khi thêm thành viên: ${response.error!.message}");
    }
  }
}

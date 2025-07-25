import 'package:an_trua_hinet/models/meal.dart';
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
        .select()
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
}

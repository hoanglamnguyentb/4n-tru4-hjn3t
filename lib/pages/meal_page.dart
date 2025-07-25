import 'package:an_trua_hinet/core/constants/constants.dart';
import 'package:an_trua_hinet/core/utils/formatters.dart';
import 'package:an_trua_hinet/core/widgets/app_divider.dart';
import 'package:an_trua_hinet/core/widgets/meal_card.dart';
import 'package:an_trua_hinet/models/meal.dart';
import 'package:an_trua_hinet/services/meal_service.dart';
import 'package:flutter/material.dart';

class MealPage extends StatefulWidget {
  const MealPage({super.key});

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  double _totalAmount = 0;
  List<Meal> _meals = [];
  bool _isLoadingMore = false;
  bool _hasMore = true;
  int _pageSize = 10;

  @override
  void initState() {
    super.initState();
    _loadMeals();
    _loadTotalAmount();
  }

  Future<void> _loadMeals({bool loadMore = false}) async {
    if (_isLoadingMore || !_hasMore) return;
    setState(() => _isLoadingMore = true);
    final from = _meals.length;
    final to = from + _pageSize - 1;
    try {
      final fetched = await MealService.fetchMealsPaginated(from, to);
      setState(() {
        _meals.addAll(fetched);
        _isLoadingMore = false;
        if (fetched.length < _pageSize) _hasMore = false;
      });
    } catch (e) {
      setState(() => _isLoadingMore = false);
    }
  }

  Future<void> _loadTotalAmount() async {
    final total = await MealService.getTotalAmount();
    setState(() {
      _totalAmount = total;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            key: ValueKey('titleRow'),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Tổng số",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
              ),
              Text(
                currencyFormat.format(_totalAmount),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: colorBlue,
                ),
              ),
            ],
          ),
        ),
        body: NotificationListener<ScrollNotification>(
          onNotification: (scrollInfo) {
            if (!_isLoadingMore &&
                _hasMore &&
                scrollInfo.metrics.pixels >=
                    scrollInfo.metrics.maxScrollExtent - 200) {
              _loadMeals(loadMore: true);
            }
            return false;
          },
          child: _meals.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: _meals.length + (_isLoadingMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < _meals.length) {
                      return MealCard(meal: _meals[index]);
                    } else {
                      return const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                  },
                ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // thêm bữa ăn mới
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

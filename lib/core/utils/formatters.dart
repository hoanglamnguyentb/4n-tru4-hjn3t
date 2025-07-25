import 'package:intl/intl.dart';

/// Định dạng tiền tệ VNĐ
final currencyFormat = NumberFormat.currency(locale: 'vi_VN', symbol: '₫');

/// Định dạng ngày kiểu Việt Nam
final dateFormat = DateFormat('dd/MM/yyyy');

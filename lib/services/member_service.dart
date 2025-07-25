// lib/services/member_service.dart

import 'package:an_trua_hinet/services/supabase_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/member.dart';

class MemberService {
  static final _client = SupabaseService.client;
  static const _tableName = 'members';

  /// Lấy danh sách tất cả thành viên
  static Future<List<Member>> getMembers() async {
    final response = await _client.from(_tableName).select();
    final data = response as List;
    return data.map((e) => Member.fromMap(e)).toList();
  }

  /// Thêm thành viên mới
  static Future<void> addMember(String name, {String? avatarUrl}) async {
    await _client.from(_tableName).insert({
      'name': name,
      if (avatarUrl != null) 'avatar_url': avatarUrl,
    });
  }

  /// Xóa thành viên theo ID
  static Future<void> deleteMember(String id) async {
    await _client.from(_tableName).delete().eq('id', id);
  }

  /// Cập nhật thông tin thành viên
  static Future<void> updateMember(Member member) async {
    await _client.from(_tableName).update(member.toMap()).eq('id', member.id);
  }
}

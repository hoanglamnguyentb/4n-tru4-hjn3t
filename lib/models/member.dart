class Member {
  final String id;
  final String name;
  final String? avatarUrl;

  Member({required this.id, required this.name, this.avatarUrl});

  factory Member.fromMap(Map<String, dynamic> map) {
    return Member(
      id: map['id'] as String,
      name: map['name'] as String,
      avatarUrl: map['avatar_url'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'avatar_url': avatarUrl};
  }
}

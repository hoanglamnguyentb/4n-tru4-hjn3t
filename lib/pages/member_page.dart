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
  List<Member> _members = [];
  bool isLoading = true;
  //Phần tìm kiếm
  bool isSearching = false;
  String searchQuery = '';
  List<Member> filteredMembers = [];

  @override
  void initState() {
    super.initState();
    _loadMembers();
  }

  Future<void> _loadMembers() async {
    try {
      final members = await MemberService.getMembers();
      setState(() {
        _members = members;
        filteredMembers = members;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
    }
  }

  void _filterMembers(String query) {
    final results = _members
        .where(
          (member) => member.name.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
    setState(() {
      searchQuery = query;
      filteredMembers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            child: isSearching
                ? TextField(
                    key: ValueKey('searchField'),
                    autofocus: true,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 12,
                      ),
                      hintText: 'Tìm kiếm thành viên...',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear, size: 20),
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            isSearching = false;
                            searchQuery = '';
                            filteredMembers = _members;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: _filterMembers,
                  )
                : Row(
                    key: ValueKey('titleRow'),
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Thành viên nhóm",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.search, size: 24),
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            isSearching = true;
                          });
                        },
                      ),
                    ],
                  ),
          ),
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredMembers.length,
                      itemBuilder: (context, index) {
                        final member = filteredMembers[index];
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

import 'package:an_trua_hinet/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Tên đăng nhập',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Mật khẩu',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            CustomButton(
              text: "Đăng nhập",
              onPressed: () {
                final username = usernameController.text;
                final password = passwordController.text;
                // Xử lý đăng nhập tại đây
                if (username == 'admin' && password == '123456') {
                  // Giả sử đăng nhập thành công
                  context.go('/home');
                } else {
                  // Hiển thị thông báo lỗi
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Sai tên đăng nhập hoặc mật khẩu.'),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

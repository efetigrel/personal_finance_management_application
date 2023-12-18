import 'package:flutter/material.dart';
import 'package:personal_finance_management_application/services/authentication.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthenticationService _authenticationService = AuthenticationService();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giriş Yap'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Kullanıcı Adı'),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Şifre'),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _login(context),
              child: Text('Giriş Yap'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _login(BuildContext context) async {
    final String username = _usernameController.text.trim();
    final String password = _passwordController.text.trim();

    if (username.isNotEmpty && password.isNotEmpty) {
      final isAuthenticated =
          await _authenticationService.authenticateUser(username, password);

      if (isAuthenticated) {
        // Kullanıcı doğrulandı, ana ekrana yönlendir
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        // Kullanıcı doğrulanamadı, hata göster
        _showErrorDialog(context, 'Kullanıcı adı veya şifre hatalı');
      }
    } else {
      // Kullanıcı adı veya şifre boş, hata göster
      _showErrorDialog(context, 'Kullanıcı adı ve şifre boş olamaz');
    }
  }

  void _showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Hata'),
        content: Text(errorMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Tamam'),
          ),
        ],
      ),
    );
  }
}

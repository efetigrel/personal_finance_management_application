import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthenticationService {
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  Future<bool> authenticateUser(String username, String password) async {
    // Kullanıcının varlığını ve şifresini kontrol et
    final savedUsername = await _secureStorage.read(key: 'username');
    final savedPasswordHash = await _secureStorage.read(key: 'passwordHash');

    if (savedUsername == username &&
        _hashPassword(password) == savedPasswordHash) {
      // Kullanıcı doğrulandı
      return true;
    } else {
      return false;
    }
  }

  Future<void> saveUserCredentials(String username, String password) async {
    // Kullanıcı bilgilerini güvenli depolama alanına kaydet
    await _secureStorage.write(key: 'username', value: username);
    await _secureStorage.write(
        key: 'passwordHash', value: _hashPassword(password));
  }

  Future<void> clearUserCredentials() async {
    // Kullanıcı bilgilerini sil
    await _secureStorage.deleteAll();
  }

  String _hashPassword(String password) {
    // Şifreyi SHA-256 algoritması ile hashle
    final bytes = utf8.encode(password);
    final hash = sha256.convert(bytes);
    return hash.toString();
  }
}

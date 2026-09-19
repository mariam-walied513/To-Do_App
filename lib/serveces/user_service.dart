class UserService {
  static final Map<String, Object> _storage = <String, Object>{};

  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _usernameKey = 'username';
  static const String _userIdKey = 'user_id';
  static const String _isLoggedInKey = 'is_logged_in';

  // ============ Access Token ============
  static Future<void> saveAccessToken(String token) async {
    _storage[_accessTokenKey] = token;
  }

  static Future<String?> getAccessToken() async {
    return _storage[_accessTokenKey] as String?;
  }

  // ============ Refresh Token ============
  static Future<void> saveRefreshToken(String token) async {
    _storage[_refreshTokenKey] = token;
  }

  static Future<String?> getRefreshToken() async {
    return _storage[_refreshTokenKey] as String?;
  }

  // ============ Username ============
  static Future<void> saveUsername(String username) async {
    _storage[_usernameKey] = username;
  }

  static Future<String?> getUsername() async {
    return _storage[_usernameKey] as String?;
  }

  // ============ User ID ============
  static Future<void> saveUserId(int id) async {
    _storage[_userIdKey] = id;
  }

  static Future<int?> getUserId() async {
    return _storage[_userIdKey] as int?;
  }

  // ============ Login Status ============
  static Future<void> setLoggedIn(bool value) async {
    _storage[_isLoggedInKey] = value;
  }

  static Future<bool> isLoggedIn() async {
    return _storage[_isLoggedInKey] as bool? ?? false;
  }

  // ============ Logout ============
  static Future<void> logout() async {
    _storage.remove(_accessTokenKey);
    _storage.remove(_refreshTokenKey);
    _storage.remove(_usernameKey);
    _storage.remove(_userIdKey);
    _storage[_isLoggedInKey] = false;
  }
}
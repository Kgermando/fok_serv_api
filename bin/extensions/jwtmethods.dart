import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

import '../models/users/user_model.dart';

String generateAuthToken(UserModel user, String secretServerKey) {
  final jwt = JWT({
    'id': user.id,
    'exp': DateTime.now().add(Duration(minutes: 10)).millisecondsSinceEpoch ~/
      1000,
    'type': 'auth',
  });
  return jwt.sign(SecretKey(secretServerKey));
}

String generateRefreshToken(UserModel user, String secretServerKey) {
  final jwt = JWT({
    'id': user.id,
    'exp':
        DateTime.now().add(Duration(days: 15)).millisecondsSinceEpoch ~/ 1000,
    'type': 'refresh',
  });
  return jwt.sign(SecretKey(secretServerKey));
}

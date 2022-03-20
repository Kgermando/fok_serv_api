import 'dart:math';

import 'package:postgres/postgres.dart';

import '../../db/config_db.dart';
import '../../models/users/refresh_token.dart';

class RefreshTokensRepository {
  final PostgreSQLConnection _executor;
  final String _tableName;
  const RefreshTokensRepository(this._executor, this._tableName);

  Future<int> _generateId() async {
    int id = Random().nextInt(2147483647);
    while (!await _isUniqueId(id)) {
      id = Random().nextInt(2147483647);
    }
    return id;
  }

  Future<bool> _isUniqueId(int id) async {
    var data =
        await _executor.query("SELECT * FROM  $_tableName WHERE \"id\" = '$id'");
    return data.isEmpty ? true : data[0].isEmpty;
  }

  Future<void> write(RefreshTokenModel refreshTokenModel) async {
    refreshTokenModel.id = await _generateId();

    var owner = refreshTokenModel.owner;
    var token = refreshTokenModel.token;

    await _executor.transaction((ctx) async {
      var result = await ctx.execute(
        "INSERT INTO $_tableName VALUES (nextval('refresh_tokens_id_seq'), '$owner', '$token');");
    });
    await ConnexionDatabase().closeConnection(_executor);
  }

  Future<RefreshTokenModel> get(String refreshToken) async {
    var rows = await _executor.query(
        "SELECT * FROM $_tableName WHERE \"token\"='$refreshToken'");
    return RefreshTokenModel(
        id: rows[0][0], owner: rows[0][1], token: rows[0][2]);
  }

  Future<void> rewrite(RefreshTokenModel refreshToken) async {
    var id = refreshToken.id;
    var owner = refreshToken.owner;
    var token = refreshToken.token;
    await _executor.query(
      "UPDATE $_tableName SET \"token\"=$token WHERE \"id\"='$id' AND \"owner\"='$owner'");
  }

  Future<void> logout(RefreshTokenModel refreshToken) async {
    var owner = refreshToken.owner;
    var token = refreshToken.token;

    await _executor.query(
      "DELETE * FROM $_tableName WHERE \"token\"='$token' AND \"owner\"='$owner'"
    );
  }

  Future<void> logoutAll(int owner) async {
    await _executor.query(
      "DELETE FROM $_tableName WHERE \"owner\"='$owner'"
    );
  }


  

  
 
}
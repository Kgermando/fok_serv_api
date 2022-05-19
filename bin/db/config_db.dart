import 'package:postgres/postgres.dart';

class ConnexionDatabase {
  Future<PostgreSQLConnection> connection() async {
    var connection = PostgreSQLConnection('167.71.4.3', 5432, "postgres",
        username: "postgres", password: "kataku", useSSL: false);

    print('Database connecting...');
    return connection;
  }

  // Future closeConnection(PostgreSQLConnection connection) async {
  //   await connection.close();
  // }
}

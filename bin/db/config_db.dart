import 'package:postgres/postgres.dart';

class ConnexionDatabase {
  Future<PostgreSQLConnection> connection() async {
    var connection = PostgreSQLConnection("db", 5432, "postgres",
        username: "postgres", password: "kataku", useSSL: false);

    print('Database connecting...');
    return connection;
  }

  // Future closeConnection(PostgreSQLConnection connection) async {
  //   await connection.close();
  // }
}

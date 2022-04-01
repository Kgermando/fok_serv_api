import 'package:postgres/postgres.dart';

class ConnexionDatabase {
  Future<PostgreSQLConnection> connection() async {
    var connection = PostgreSQLConnection("localhost", 5432, "fokadDB",
        username: "postgres", password: "kataku", useSSL: false);

    print('Database connecting...');
    return connection;
  }

  // Future closeConnection(PostgreSQLConnection connection) async {
  //   await connection.close();
  // }
}

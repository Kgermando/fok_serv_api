import 'package:postgres/postgres.dart';

class DetteRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  DetteRepository(this.executor, this.tableName);
}
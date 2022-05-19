import 'package:dotenv/dotenv.dart';

void loadEnv() =>  DotEnv(includePlatformEnvironment: true)..load();

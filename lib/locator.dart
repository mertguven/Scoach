import 'package:get_it/get_it.dart';
import 'package:scoach/repository/user_repository.dart';
import 'package:scoach/sevices/firebase_auth_service.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => FirebaseAuthService());
  locator.registerLazySingleton(() => UserRepository());
}

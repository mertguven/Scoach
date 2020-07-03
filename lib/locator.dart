import 'package:get_it/get_it.dart';
import 'package:scoach/repository/user_repository.dart';
import 'package:scoach/services/firebase_auth_service.dart';
import 'package:scoach/services/firebase_storage_service.dart';
import 'package:scoach/services/firestore_db_service.dart';

GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(() => FirebaseAuthService());
  locator.registerLazySingleton(() => UserRepository());
  locator.registerLazySingleton(() => FirestoreDBService());
  locator.registerLazySingleton(() => FirebaseStorageService());
}
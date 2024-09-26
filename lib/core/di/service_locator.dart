import 'package:get_it/get_it.dart';
import 'package:tennis_player_app/Features/auth/data/Repositories/auth_repository_impl.dart';
import 'package:tennis_player_app/Features/auth/data/Repositories/firestore_database_repository_impl.dart';
import 'package:tennis_player_app/Features/auth/data/data%20sources/firebase_auth_data_source.dart';
import 'package:tennis_player_app/Features/auth/data/data%20sources/firebase_firestore_data_source.dart';
import 'package:tennis_player_app/Features/auth/domain/Repositories/auth_repository.dart';
import 'package:tennis_player_app/Features/auth/domain/Repositories/firestore_database_repository.dart';
import 'package:tennis_player_app/Features/auth/domain/Use%20Cases/login_use_case.dart';
import 'package:tennis_player_app/Features/auth/domain/Use%20Cases/register_use_case.dart';
import 'package:tennis_player_app/Features/auth/domain/Use%20Cases/reset_password_use_case.dart';
import 'package:tennis_player_app/Features/auth/presentation/view%20model/bloc/bloc/auth_bloc.dart';

final GetIt sl = GetIt.instance;

setupLocator() {
  sl.registerLazySingleton<FirebaseAuthDataSource>(
    () => FirebaseAuthDataSourceImpl(),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(
      authRepository: sl(),
    ),
  );
  sl.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(
      authRepository: sl(),
    ),
  );
  sl.registerLazySingleton<ResetPasswordUseCase>(
    () => ResetPasswordUseCase(
      authRepository: sl(),
    ),
  );
  sl.registerLazySingleton<FirebaseFirestoreDataSource>(
    () => FirebaseFirestoreDataSourceImpl(),
  );
  sl.registerLazySingleton<FirestoreDatabaseRepository>(
    () => FirestoreDatabaseRepositoryImpl(
      firebaseFirestoreDataSource: sl(),
    ),
  );
  sl.registerSingleton<AuthBloc>(
    AuthBloc(
      sl(),
      sl(),
      sl(),
      sl(),
    ),
  );
}

import 'package:get_it/get_it.dart';
import 'package:tennis_player_app/Features/Favorite/data/data%20sources/db_data_source.dart';
import 'package:tennis_player_app/Features/Favorite/data/repositories/fav_repository_impl.dart';
import 'package:tennis_player_app/Features/Favorite/domain/repositories/fav_repository.dart';
import 'package:tennis_player_app/Features/Favorite/domain/use%20cases/add_data_to_db.dart';
import 'package:tennis_player_app/Features/Favorite/domain/use%20cases/delete_data_from_db_use_case.dart';
import 'package:tennis_player_app/Features/Favorite/domain/use%20cases/get_data_from_db_use_case.dart';
import 'package:tennis_player_app/Features/Home/Presentation/view%20model/GetWeatherBloc/get_weather_bloc.dart';
import 'package:tennis_player_app/Features/Home/Presentation/view%20model/UserInfoBloc/get_user_info_bloc.dart';
import 'package:tennis_player_app/Features/Home/data/Repositories/home_repository_impl.dart';
import 'package:tennis_player_app/Features/Home/data/data%20source/get_weather_data_source.dart';
import 'package:tennis_player_app/Features/Home/domain/Repositories/home_repository.dart';
import 'package:tennis_player_app/Features/Home/domain/use%20cases/get_forcast_weather_use_case.dart';
import 'package:tennis_player_app/Features/Home/domain/use%20cases/get_user_info_use_case.dart';
import 'package:tennis_player_app/Features/Home/domain/use%20cases/get_user_location_use_case.dart';
import 'package:tennis_player_app/Features/auth/data/Repositories/auth_repository_impl.dart';
import 'package:tennis_player_app/Features/auth/data/Repositories/firestore_database_repository_impl.dart';
import 'package:tennis_player_app/Features/auth/data/data%20sources/firebase_auth_data_source.dart';
import 'package:tennis_player_app/Features/auth/data/data%20sources/firebase_firestore_data_source.dart';
import 'package:tennis_player_app/Features/auth/domain/Repositories/auth_repository.dart';
import 'package:tennis_player_app/Features/auth/domain/Repositories/firestore_database_repository.dart';
import 'package:tennis_player_app/Features/auth/domain/Use%20Cases/login_use_case.dart';
import 'package:tennis_player_app/Features/auth/domain/Use%20Cases/register_use_case.dart';
import 'package:tennis_player_app/Features/auth/domain/Use%20Cases/reset_password_use_case.dart';
import 'package:tennis_player_app/Features/auth/presentation/view%20model/bloc/Auth%20Bloc/auth_bloc.dart';

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
  sl.registerLazySingleton<GetWeatherDataSource>(() => GetForcastWeather());
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      firebaseFirestoreDataSource: sl(),
      getWeatherDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<GetUserInfoUseCase>(
    () => GetUserInfoUseCase(
      homeRepository: sl(),
    ),
  );
  sl.registerLazySingleton<GetUserInfoBloc>(
    () => GetUserInfoBloc(
      sl(),
    ),
  );
  sl.registerLazySingleton<GetForcastWeatherUseCase>(
    () => GetForcastWeatherUseCase(
      homeRepository: sl(),
    ),
  );
  sl.registerLazySingleton<GetWeatherBloc>(
    () => GetWeatherBloc(
      sl(),
    ),
  );
  sl.registerLazySingleton<GetUserLocationUseCase>(
    () => GetUserLocationUseCase(
      homeRepository: sl(),
    ),
  );
  sl.registerLazySingleton<DBDataSource>(() => DBDataSourceImpl());
  sl.registerLazySingleton<FavRepository>(
    () => FavRepositoryImpl(
      db: sl(),
    ),
  );
  sl.registerLazySingleton<GetDataFromDbUseCase>(
    () => GetDataFromDbUseCase(
      favRepository: sl(),
    ),
  );
  sl.registerLazySingleton<DeleteDataFromDbUseCase>(
    () => DeleteDataFromDbUseCase(
      favRepository: sl(),
    ),
  );
  sl.registerLazySingleton<AddDataToDbUseCase>(
    () => AddDataToDbUseCase(
      favRepository: sl(),
    ),
  );
}

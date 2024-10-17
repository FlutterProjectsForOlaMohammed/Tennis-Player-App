import 'package:get_it/get_it.dart';
import 'package:tennis_player_app/Features/Favorite/data/data%20sources/db_data_source.dart';
import 'package:tennis_player_app/Features/Favorite/data/repositories/fav_repository_impl.dart';
import 'package:tennis_player_app/Features/Favorite/domain/repositories/fav_repository.dart';
import 'package:tennis_player_app/Features/Favorite/domain/use%20cases/add_data_to_db.dart';
import 'package:tennis_player_app/Features/Favorite/domain/use%20cases/delete_data_from_db_use_case.dart';
import 'package:tennis_player_app/Features/Favorite/domain/use%20cases/get_data_from_db_use_case.dart';
import 'package:tennis_player_app/Features/Home/Presentation/view%20model/Get%20User%20Info/get_user_info_bloc.dart';
import 'package:tennis_player_app/Features/Home/data/data%20source/home_firebase_firestore_data_source_impl.dart';
import 'package:tennis_player_app/Features/Profile/Presentation/view%20model/Update%20User%20Info%20Bloc/update_user_info_bloc.dart';
import 'package:tennis_player_app/Features/Profile/data/Repositories/profile_repository_impl.dart';
import 'package:tennis_player_app/Features/Profile/data/data%20source/profile_firebase_firestore_data_source_impl.dart';
import 'package:tennis_player_app/Features/Profile/domain/Repositories/profile_repository.dart';
import 'package:tennis_player_app/Features/Profile/domain/Use%20Cases/update_user_info_use_case.dart';
import 'package:tennis_player_app/Features/auth/domain/Use%20Cases/add_new_user_to_firebase_db_use_case.dart';
import 'package:tennis_player_app/core/common/Functions/get_user_info_from_firebase_db.dart';
import 'package:tennis_player_app/core/common/blocs/GetWeatherBloc/get_weather_bloc.dart';
import 'package:tennis_player_app/Features/Home/data/Repositories/home_repository_impl.dart';
import 'package:tennis_player_app/Features/Home/data/data%20source/ai_prediction_data_source.dart';
import 'package:tennis_player_app/Features/Home/data/data%20source/get_weather_data_source.dart';
import 'package:tennis_player_app/Features/Home/domain/Repositories/home_repository.dart';
import 'package:tennis_player_app/Features/Home/domain/use%20cases/get_ai_prediction_use_case.dart';
import 'package:tennis_player_app/Features/Home/domain/use%20cases/get_forcast_weather_use_case.dart';
import 'package:tennis_player_app/Features/Home/domain/use%20cases/get_user_info_use_case.dart';
import 'package:tennis_player_app/Features/Home/domain/use%20cases/get_user_location_use_case.dart';
import 'package:tennis_player_app/Features/auth/data/Repositories/auth_repository_impl.dart';
import 'package:tennis_player_app/Features/auth/data/data%20sources/firebase_auth_data_source.dart';
import 'package:tennis_player_app/Features/auth/data/data%20sources/auth_firebase_firestore_data_source_impl.dart';
import 'package:tennis_player_app/Features/auth/domain/Repositories/auth_repository.dart';
import 'package:tennis_player_app/Features/auth/domain/Use%20Cases/login_use_case.dart';
import 'package:tennis_player_app/Features/auth/domain/Use%20Cases/register_use_case.dart';
import 'package:tennis_player_app/Features/auth/domain/Use%20Cases/reset_password_use_case.dart';
import 'package:tennis_player_app/Features/auth/presentation/view%20model/bloc/Auth%20Bloc/auth_bloc.dart';

final GetIt sl = GetIt.instance;

setupLocator() {
  sl.registerLazySingleton<FirebaseAuthDataSource>(
    () => FirebaseAuthDataSourceImpl(),
  );
  sl.registerLazySingleton<GetUserInfoFromFirebaseDb>(
      () => GetUserInfoFromFirebaseDb());
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      AuthFirebaseFirestoreDataSourceImpl(
        getUserInfoFromFirebaseDb: sl(),
      ),
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
  sl.registerLazySingleton<AddNewUserToFirebaseDbUseCase>(
    () => AddNewUserToFirebaseDbUseCase(
      authFirestoreDatabaseRepository: sl(),
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
  sl.registerLazySingleton<AiPredictionDataSource>(
      () => AiPredictionDataSourceImpl());
  sl.registerLazySingleton<GetAiPredictionUseCase>(
    () => GetAiPredictionUseCase(
      homeRepository: sl(),
    ),
  );
  sl.registerLazySingleton<GetWeatherDataSource>(() => GetForcastWeather());
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      aiPredictionDataSource: sl(),
      firebaseFirestoreDataSource: HomeFirebaseFirestoreDataSourceImpl(
        getUserInfoFromFirebaseDb: sl(),
      ),
      getWeatherDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<GetUserInfoUseCase>(
    () => GetUserInfoUseCase(
      homeRepository: sl(),
    ),
  );
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      firebaseFirestoreDataSource: ProfileFirebaseFirestoreDataSourceImpl(
        getUserInfoFromFirebaseDb: sl(),
      ),
    ),
  );
  sl.registerLazySingleton<UpdateUserInfoUseCase>(
    () => UpdateUserInfoUseCase(
      profileRepository: sl(),
    ),
  );
  sl.registerLazySingleton<GetUserInfoBloc>(
    () => GetUserInfoBloc(
      sl(),
    ),
  );
  sl.registerLazySingleton<UpdateUserInfoBloc>(
    () => UpdateUserInfoBloc(
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

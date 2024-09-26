import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:tennis_player_app/Features/auth/domain/Entities/user_entity.dart';
import 'package:tennis_player_app/core/errors/failures.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthDataSource {
  Future<Either<Failure, Unit>> loginOperation({required UserEntity user});

  Future<Either<Failure, Unit>> registerOperation({required UserEntity user});

  Future<Either<Failure, Unit>> resetPasswordOperation(
      {required UserEntity user});
}

class FirebaseAuthDataSourceImpl implements FirebaseAuthDataSource {
  @override
  Future<Either<Failure, Unit>> loginOperation(
      {required UserEntity user}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: user.email, password: user.password);

      return const Right(unit);
    } on FirebaseAuthException catch (e) {
      return Left(
        FirebaseAuthFailure.handleError(e),
      );
    } catch (e) {
      return Left(
        UnexpectedFailure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> registerOperation(
      {required UserEntity user}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      return const Right(unit);
    } on FirebaseAuthException catch (e) {
      return Left(
        FirebaseAuthFailure.handleError(e),
      );
    } catch (e) {
      return Left(
        UnexpectedFailure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> resetPasswordOperation({
    required UserEntity user,
  }) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: user.email,
      );
      return const Right(unit);
    } on FirebaseAuthException catch (e) {
      return Left(
        FirebaseAuthFailure.handleError(e),
      );
    } on PlatformException catch (e) {
      return Left(
        UnexpectedFailure(
            message: 'Platform exception: ${e.code} - ${e.message}'),
      );
    } on Exception catch (e) {
      return Left(
        UnexpectedFailure(
          message: e.toString(),
        ),
      );
    }
  }
}

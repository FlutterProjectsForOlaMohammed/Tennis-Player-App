import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure {
  final String message;

  const Failure({
    required this.message,
  });
}

class FirebaseAuthFailure extends Failure {
  const FirebaseAuthFailure({required super.message});
  factory FirebaseAuthFailure.handleError(FirebaseAuthException error) {
    switch (error.code) {
      case 'user-not-found':
        return const FirebaseAuthFailure(
          message: 'No user found for that email.',
        );
      case 'wrong-password':
        return const FirebaseAuthFailure(
          message: 'Wrong password provided for that user.',
        );
      case 'too-many-requests':
        return const FirebaseAuthFailure(
          message: 'Too many requests. Please try again later.',
        );
      case 'operation-not-allowed':
        return const FirebaseAuthFailure(
          message: 'This operation is not allowed. Please contact support.',
        );
      case 'user-disabled':
        return const FirebaseAuthFailure(
          message: 'This user account is disabled.',
        );
      case 'invalid-email':
        return const FirebaseAuthFailure(
          message: 'Please enter a valid email address.',
        );
      case 'weak-password':
        return const FirebaseAuthFailure(
          message: 'The password provided is too weak.',
        );
      case 'email-already-in-use':
        return const FirebaseAuthFailure(
          message: 'This email address is already in use.',
        );
      case 'invalid-credential':
        return const FirebaseAuthFailure(
          message: 'The provided credentials are invalid.',
        );
      case 'account-exists-with-different-credential':
        return const FirebaseAuthFailure(
          message:
              'An account already exists with the same email but a different sign-in method.',
        );
      case 'credential-already-in-use':
        return const FirebaseAuthFailure(
          message:
              'The credential is already associated with another user account.',
        );
      case 'too-many-attempts':
        return const FirebaseAuthFailure(
          message:
              'Too many attempts to verify the phone number. Please try again later.',
        );
      case 'session-expired':
        return const FirebaseAuthFailure(
          message:
              'The phone number verification session has expired. Please try again.',
        );
      case 'invalid-phone-number':
        return const FirebaseAuthFailure(
          message: 'Please enter a valid phone number.',
        );
      case 'network-request-failed':
        return const FirebaseAuthFailure(
          message: 'Network error. Please check your internet connection.',
        );
      default:
        return const FirebaseAuthFailure(
          message: 'An error occurred. Please try again later.',
        );
    }
  }
}

class FirebaseFirestoreFailure extends Failure {
  const FirebaseFirestoreFailure({required super.message});
  factory FirebaseFirestoreFailure.handleError(FirebaseException error) {
    switch (error.code) {
      case 'permission-denied':
        return const FirebaseFirestoreFailure(
          message: 'You do not have permission to perform this operation.',
        );
      case 'unavailable':
        return const FirebaseFirestoreFailure(
          message: 'Firestore service is currently unavailable.',
        );
      case 'invalid-argument':
        return const FirebaseFirestoreFailure(
          message: 'Invalid data was provided.',
        );
      case 'already-exists':
        return const FirebaseFirestoreFailure(
          message: 'The document already exists.',
        );
      case 'deadline-exceeded':
        return const FirebaseFirestoreFailure(
          message: 'The operation took too long to complete.',
        );
      case 'failed-precondition':
        return const FirebaseFirestoreFailure(
          message: 'A required condition was not met.',
        );
      case 'resource-exhausted':
        return const FirebaseFirestoreFailure(
          message: 'Quota or rate limit exceeded.',
        );
      case 'unauthenticated':
        return const FirebaseFirestoreFailure(
          message: 'You must be authenticated to perform this operation.',
        );
      default:
        return const FirebaseFirestoreFailure(
          message: 'An error occurred. Please try again later.',
        );
    }
  }
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure({required super.message});
}

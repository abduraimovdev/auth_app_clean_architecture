import 'package:ui_one/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  // factory AuthRepository() => AuthRepositoryImpl();

  // Bizness Logica shu yerda yoziladi
 
  Map<String, Object> signUp(User user);
  Map<String, Object> signIn(String email, String password);
  forgotPassword();
  logOut();
  deleteAccount();
  editProfile();
  viewProfile();
}

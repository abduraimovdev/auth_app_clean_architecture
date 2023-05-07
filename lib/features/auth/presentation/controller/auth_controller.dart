
import '../../domain/entities/user.dart';
import '../../domain/repasitory/auth_repository.dart';

class AuthController {
  AuthController._();
  static final AuthController _instance = AuthController._();
  factory AuthController(AuthRepository repository) {
    authRepository = repository;
    return _instance;
  }
  static late final AuthRepository authRepository;

  Map<String, String> registration(
    String name,
    String email,
    String birthDate,
    String password,
  ) {
    Map<String, String> result = {};

    if (!name.isNotEmpty &&
        name.startsWith(
          RegExp(r"^[A-Z].{3}$"),
        )) {
      result["message"] = "Wrong Name";
      result["next"] = "not";
      return result;
    }

    if (!email.contains(
      RegExp(r'^([a-zA-Z\d._%+-]+)@([a-zA-Z\d.-]+\.[a-zA-Z]{2,})$'),
    )) {
      result["message"] = "Wrong Email";
      result["next"] = "not";
      return result;
    }

    if (!birthDate.contains(
      RegExp(r'^[0-9]{2}\.[0-9]{2}\.[0-9]{4}$'),
    )) {
      result["message"] = "Wrong Date";
      result["next"] = "not";
      return result;
    }

    if (!password.contains(
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,20}$'),
    )) {
      result["message"] = "Wrong Password";
      result["next"] = "not";
      return result;
    }

    final user = User("00", name, email, birthDate, password);
    final response = authRepository.signUp(user);
    result["message"] = response["message"] as String;
    result["next"] = (response["success"] as bool) ? "next" : "not";
    return result;
  }

  Map<String, String> login(
    String email,
    String password,
  ) {
    Map<String, String> result = {};



    if (!email.contains(
      RegExp(r'^([a-zA-Z\d._%+-]+)@([a-zA-Z\d.-]+\.[a-zA-Z]{2,})$'),
    )) {
      result["message"] = "Wrong Email";
      result["next"] = "not";
      return result;
    }


    if (!password.contains(
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,20}$'),
    )) {
      result["message"] = "Wrong Password";
      result["next"] = "not";
      return result;
    }

    final response = authRepository.signIn(email, password);
    result["message"] = response["message"] as String;
    result["next"] = (response["success"] as bool) ? "next" : "not";
    return result;
  }
}

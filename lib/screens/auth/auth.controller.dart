// import 'package:frontend/screens/auth/auth.controller.g.dart';
import 'package:frontend/screens/auth/auth.model.dart';
import 'package:frontend/screens/auth/auth.service.dart';
import 'package:mobx/mobx.dart';

part 'auth.controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  @action
  create(
      String name,
      String email,
      String image,
      String choseLanguage,
      String choseHearAbout,
      String choseKnowledge,
      String choseLevel,
      String age) async {
    await AuthService().signin(name, email, image, choseLanguage,
        choseHearAbout, choseKnowledge, choseLevel, age);
  }

  @action
  getLanguage() async {}
}

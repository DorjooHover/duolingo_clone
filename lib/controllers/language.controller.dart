import 'package:frontend/models/language.model.dart';
import 'package:frontend/services/language.service.dart';
import 'package:mobx/mobx.dart';

part 'language.controller.g.dart';

class LanguageController = _LanguageControllerBase with _$LanguageController;

abstract class _LanguageControllerBase with Store {
  @observable
  List<LanguageModel> languages = [];
}

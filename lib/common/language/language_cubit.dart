import 'package:flappy_dash/resources/translations/language.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageCubit extends Cubit<AppLanguage> {
  LanguageCubit({required AppLanguage preferredLanguage})
    : super(preferredLanguage);

  void update(AppLanguage language) {
    emit(language);
  }
}

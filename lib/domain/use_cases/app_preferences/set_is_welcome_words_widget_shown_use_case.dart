import 'package:injectable/injectable.dart';
import 'package:vocabulary/core/models/result.dart';
import 'package:vocabulary/data/repositories/app_preferences/app_preferences_repository.dart';

@injectable
class SetIsWordsWelcomeWidgetShownUseCase {
  final AppPreferencesRepository _appPreferencesRepository;
  SetIsWordsWelcomeWidgetShownUseCase(this._appPreferencesRepository);

  Future<Result<void>> call(bool isShown) async {
    return await _appPreferencesRepository.setIsWordsWelcomeWidgetShown(
      isShown,
    );
  }
}

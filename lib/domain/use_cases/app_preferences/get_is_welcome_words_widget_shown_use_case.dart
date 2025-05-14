import 'package:injectable/injectable.dart';
import 'package:vocabulary/data/repositories/app_preferences/app_preferences_repository.dart';

/// Use case to check whenever this is the first app launch.
@injectable
class GetIsWordsWelcomeWidgetShownUseCase {
  final AppPreferencesRepository _appPreferencesRepository;
  GetIsWordsWelcomeWidgetShownUseCase(this._appPreferencesRepository);

  bool call() {
    return _appPreferencesRepository.getIsWordsWelcomeWidgetShown();
  }
}

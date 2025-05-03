import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class GetItModule {
  @lazySingleton
  Logger get logger => Logger();
}

import 'package:life_style_hub/providers/api_provider.dart';
import 'package:life_style_hub/providers/repository.dart';

class RepositoryProvider {
  Repository provideRepository() => Repository(ApiProvider());
}

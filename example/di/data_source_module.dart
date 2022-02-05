import 'package:dependon/dependon.dart';

import '../data/user/user_data_source.dart';
import '../data/user/user_data_source_impl.dart';

class DataSourceModule extends Module {
  @override
  void dependencies() {
    singleton<UserDataSource>(() => UserDataSourceImpl(get()));
  }
}

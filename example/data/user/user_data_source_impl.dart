import '../settings/settings.dart';
import 'user_data_source.dart';
import 'model/user_model.dart';

class UserDataSourceImpl extends UserDataSource {
  UserDataSourceImpl(this._settings);

  final Settings _settings;

  @override
  Future<List<UserModel>> fetchUsers() async {
    await Future.delayed(_settings.waitTime);

    return [
      UserModel("1", "Gustavo", "23"),
      UserModel("2", "Vinicius", "26"),
    ];
  }
}

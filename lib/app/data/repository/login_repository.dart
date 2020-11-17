import 'package:getXStudy/app/data/model/user_model.dart';
import 'package:getXStudy/app/data/provider/login_provider.dart';
import 'package:meta/meta.dart';

//Interliga provider com controller
class LoginRepository {
  final LoginApiClient apiClient = LoginApiClient();

  Future<UserModel> createUser(String email, String password, String name) {
    return apiClient.createUser(email, password, name);
  }

  Future<UserModel> signIn(String email, String password) {
    return apiClient.signInWithEmail(email, password);
  }

  signOut() {
    apiClient.signOut();
  }
}

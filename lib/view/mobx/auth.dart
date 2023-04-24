import 'package:email_validator/email_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tests_app/common/theme/colors.dart';

part 'auth.g.dart';

class Auth = AuthBase with _$Auth;

abstract class AuthBase with Store {
  @observable
  List<bool> authType = [true, false];

  @action
  void changeAuthType({required List<bool> tappedLoginButton}) {
    authType = tappedLoginButton;
  }

  @action
  void loginToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: AppTheme.bgSwitcher,
        textColor: AppTheme.white,
        fontSize: 16.0);
  }
  
  @action
  startAuth({String? email, required String? userName, required String? password}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (authType[0]) {
      if (userName == prefs.getString('username') && password == prefs.getString('password')) {
        return loginToast('Success!');
      } else {
        return loginToast('ERROR!');
      }
    } else {
      if (email!.isNotEmpty && userName!.isNotEmpty && password!.isNotEmpty) {
        if (EmailValidator.validate(email)) {
          prefs.setString('email', email);
          prefs.setString('username', userName);
          prefs.setString('password', password);
          return loginToast('Success!');
        } else {
          return loginToast('email is not valid!');
        }
      } else {
        return loginToast('Fill data');
      }
    }
  }
}
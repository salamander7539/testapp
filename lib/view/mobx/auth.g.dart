// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Auth on AuthBase, Store {
  late final _$authTypeAtom = Atom(name: 'AuthBase.authType', context: context);

  @override
  List<bool> get authType {
    _$authTypeAtom.reportRead();
    return super.authType;
  }

  @override
  set authType(List<bool> value) {
    _$authTypeAtom.reportWrite(value, super.authType, () {
      super.authType = value;
    });
  }

  late final _$startAuthAsyncAction =
      AsyncAction('AuthBase.startAuth', context: context);

  @override
  Future startAuth(
      {String? email, required String? userName, required String? password}) {
    return _$startAuthAsyncAction.run(() =>
        super.startAuth(email: email, userName: userName, password: password));
  }

  late final _$AuthBaseActionController =
      ActionController(name: 'AuthBase', context: context);

  @override
  void changeAuthType({required List<bool> tappedLoginButton}) {
    final _$actionInfo =
        _$AuthBaseActionController.startAction(name: 'AuthBase.changeAuthType');
    try {
      return super.changeAuthType(tappedLoginButton: tappedLoginButton);
    } finally {
      _$AuthBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void loginToast(String message) {
    final _$actionInfo =
        _$AuthBaseActionController.startAction(name: 'AuthBase.loginToast');
    try {
      return super.loginToast(message);
    } finally {
      _$AuthBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
authType: ${authType}
    ''';
  }
}

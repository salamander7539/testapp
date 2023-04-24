import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tests_app/common/theme/colors.dart';
import 'package:tests_app/view/mobx/auth.dart';

class Switcher extends StatelessWidget {
  final Auth auth;
  final Function() onTap;

  Switcher({
    super.key,
    required this.auth,
    required this.onTap,
  });


  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: 40,
          width: double.infinity,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(color: AppTheme.bgSwitcher, borderRadius: BorderRadius.circular(30), boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.16),
              blurRadius: 3,
              spreadRadius: 1,
              offset: const Offset(0, 4),
            )
          ]),
          child: ToggleButtons(
            isSelected: auth.authType,
            borderRadius: BorderRadius.circular(20),
            renderBorder: false,
            constraints: BoxConstraints(
              minHeight: 40.0,
              minWidth: MediaQuery.of(context).size.width * .2,
            ),
            children: [
              buildPadding(context, 'Login', [true, false], 0),
              buildPadding(context, 'Sing-up', [false, true], 1),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPadding(BuildContext context, String title, List<bool> authType, int index) {
    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        onTap();
        auth.changeAuthType(tappedLoginButton: authType);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: auth.authType[index] ? AppTheme.darkBlue : Colors.transparent,
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(color: AppTheme.white),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../helpers/btv_buttons.dart';
import '../../services/auth_service.dart';

class ActionButtons extends StatelessWidget {
  void _editPictureClicked() {}
  void _logOutClicked(context) {
    AuthService.instance.logoutAndNavigate(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BtvButton.smallSecondary(
            onPressed: () => _logOutClicked(context),
            labelText: 'Log out',
          ),
        ],
      ),
    );
  }
}

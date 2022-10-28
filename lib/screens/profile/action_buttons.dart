import 'package:flutter/material.dart';

import '../../helpers/btv_typography.dart';
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
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: ElevatedButton(
              onPressed: _editPictureClicked,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(110, 176, 230, 1),
                foregroundColor: Colors.white,
                textStyle: BtvTextStyles.button1,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                side: const BorderSide(
                    width: 1, color: Color.fromRGBO(255, 255, 255, 0.2)),
              ),
              child: const Text('Edit picture'),
            ),
          ),
          ElevatedButton(
            onPressed: () => _logOutClicked(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(204, 221, 255, 0.1),
              foregroundColor: Colors.white,
              textStyle: BtvTextStyles.button1,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              side: const BorderSide(
                  width: 1, color: Color.fromRGBO(204, 221, 255, 0.1)),
            ),
            child: const Text('Log out'),
          ),
        ],
      ),
    );
  }
}

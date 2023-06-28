import 'package:flutter/widgets.dart';

enum ButtonTypeStatus {
  menuToolButton,
}

class ButtonStatusStore extends ChangeNotifier {
  ButtonStatusStore() : super();

  Map<ButtonTypeStatus, bool> buttonsDisabled = {};

  void addDisabled(ButtonTypeStatus buttonTypeStatus) {
    if (buttonsDisabled[buttonTypeStatus] == null) {
      buttonsDisabled.addAll({buttonTypeStatus: true});
      notifyListeners();
    }
  }

  void removeDisabled(ButtonTypeStatus buttonTypeStatus) {
    if (buttonsDisabled[buttonTypeStatus] != null) {
      buttonsDisabled.remove(buttonTypeStatus);
      notifyListeners();
    }
  }
}

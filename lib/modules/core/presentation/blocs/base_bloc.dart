abstract class BaseBloc {
  void setBusy(bool st) {
    if (st) {
      //  DialogService.showLoading();
    } else {
      //  DialogService.closeLoading();
      // Modular.to.pop();
    }
  }

  void showAlert(String msg, {String? title}) {
    //DialogService.simpleAlert(title: title ?? "Alert", body: msg);
  }

  void dispose() {}
}

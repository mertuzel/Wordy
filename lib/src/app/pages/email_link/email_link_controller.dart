import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class EmailLinkController extends Controller {
  @override
  void initListeners() {
    // TODO: implement initListeners
  }

  void initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData? dynamicLink) async {
      final Uri? deepLink = dynamicLink?.link;

      if (deepLink != null) {
        print('Deep link not null authentication');
        // _presenter.authenticateWithEmailLink(
        //   email,
        //   deepLink.toString(),
        //   deleteUser,
        // );
      }
    }, onError: (e) async {
      print('onLinkError');
      print(e.message);
    });

    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null) {}
  }
}

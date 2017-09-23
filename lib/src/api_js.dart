@JS()
library grecaptcha;

import 'package:js/js.dart';

/// Dart-wrapper for Google ReCaptcha object (grecaptcha)
@JS('grecaptcha')
class GRecaptcha {
  external static void render(container, Parameters parameters);
  external static void reset([String opt_widget_id]);
  external static void getResponse([String opt_widget_id]);
}
/// Dart-wrapper for parameters object argument for grecaptcha.render function
@JS()
@anonymous
class Parameters {
  /// Creates new parameters object
  /// 
  /// For more inforamtion on parameters see https://developers.google.com/recaptcha/docs/display#render_param
  external factory Parameters({
    String sitekey,
    String theme: 'light',
    String type: 'image',
    String size: 'normal',
    num tabindex: 0,
    Function callback,
    Function expired_callback
  });
  external String get sitekey;
  external String get theme;
  external String get type;
  external String get size;
  external num get tabindex;
  external Function get callback;
  @JS('expired-callback')
  external Function get expired_callback;
}
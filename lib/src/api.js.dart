@JS()
library grecaptcha;

import 'package:js/js.dart';

/// Dart-wrapper for Google ReCaptcha object (grecaptcha)
/// 
/// [container]: element, where recaptcha is to be rendered
/// [parameters]: js-object with recaptcha parameters.
/// For more inforamtion on parameters see https://developers.google.com/recaptcha/docs/display#render_param 
@JS('grecaptcha')
class GRecaptcha {
  external static void render(container, parameters);
  external static void reset([String opt_widget_id]);
  external static void getResponse([String opt_widget_id]);
}

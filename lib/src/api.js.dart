@JS()
library recaptcha_api;

import 'package:js/js.dart';

/// Dart-wrapper for Google ReCaptcha API (grecaptcha)
/// 
/// Google ReCaptcha API documentation:
/// [https://developers.google.com/recaptcha/docs/display#js_api](https://developers.google.com/recaptcha/docs/display#js_api)
@JS('grecaptcha')
class GRecaptcha {
  /// Renders the container as a reCAPTCHA widget and returns the ID of the newly created widget.
  /// `container` The HTML element to render the reCAPTCHA widget.  Specify either the ID of the container (string) or the DOM element itself.
  /// `parameters` An object containing parameters as key=value pairs, for example, {"sitekey": "your_site_key", "theme": "light"}
  external static String render(container, parameters);
  /// Resets the reCAPTCHA widget.
  /// `opt_widget_id` Optional widget ID, defaults to the first widget created if unspecified
  external static void reset([String opt_widget_id]);
  /// Gets the response for the reCAPTCHA widget.
  /// `opt_widget_id` Optional widget ID, defaults to the first widget created if unspecified
  external static String getResponse([String opt_widget_id]);
}

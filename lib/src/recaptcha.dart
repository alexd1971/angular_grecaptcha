library angular_grecaptcha;

import 'dart:html';
import 'dart:js';
import 'dart:js_util';

import 'package:angular/angular.dart';

import 'api.js.dart';
/// Angular Google ReCaptcha component
/// 
/// This component only adds recaptcha to your form.
/// You have to verify recaptcha response server-side as described
/// [here](https://developers.google.com/recaptcha/docs/verify)
/// 
/// Basic usage example:
/// 
///     import 'package:angular_grecaptcha/angular_grecaptcha.dart';
///     ...
///     @Component(
///       selector: 'my-component',
///       template: '''
///         ...
///         <form>
///           ...
///           <g-recaptcha sitekey="YOUR SITEKEY"></g-recaptcha>
///           ...
///         </form>
///         ...
///       ''',
///       directives: const [AngularRecaptcha]
///     )
///     class MyComponent {}
/// 
/// 
/// Parameters:
/// 
/// `sitekey` Your sitekey
/// 
/// `theme` Optional. The color theme of the widget. Values: light | dark.
/// Default: light.
/// 
/// `type` Optional. The type of CAPTCHA to serve. Values: audio | image.
/// Default: image.
/// 
/// `size` Optional. The size of the widget. Values: compact | normal.
/// Default: normal.
/// 
/// `tabindex` Optional. The tabindex of the widget and challenge. 
/// If other elements in your page use tabindex, it should be set to make user navigation easier.
/// Default: 0
/// 
/// `callback` Optional. The name of your callback function to be executed
/// when the user submits a successful CAPTCHA response. The user's response, g-recaptcha-response,
/// will be the input for your callback function.
/// 
/// `expired-callback` Optional. The name of your callback function to be executed
/// when the recaptcha response expires and the user needs to solve a new CAPTCHA.
/// 
/// Original information about parameters is [here](https://developers.google.com/recaptcha/docs/display#render_param)
@Component(
  selector: 'g-recaptcha',
  template: ''
)
class AngularRecaptcha implements OnInit {
  /// Your sitekey
  @Input()
  String sitekey;
  /// Optional. The color theme of the widget. Values: light | dark
  /// Default: light.
  @Input()
  String theme;
  /// Optional. The type of CAPTCHA to serve. Values: audio | image.
  /// Default: image.
  @Input()
  String type;
  /// Optional. The size of the widget. Values: compact | normal.
  /// Default: normal.
  @Input()
  String size;
  /// Optional. The tabindex of the widget and challenge. 
  /// If other elements in your page use tabindex, it should be set to make user navigation easier.
  /// Default: 0
  @Input()
  int tabindex;
  /// Optional. The name of your callback function to be executed
  /// when the user submits a successful CAPTCHA response. The user's response, g-recaptcha-response,
  /// will be the input for your callback function.
  @Input()
  Function callback;
  /// Optional. The name of your callback function to be executed
  /// when the recaptcha response expires and the user needs to solve a new CAPTCHA.
  @Input('expired-callback')
  Function expiredCallback;
  /// Initializes Angular Google ReCaptcha component
  @override
  void ngOnInit() {
    // Loading recaptcha API only if it is not loaded yet
    if(context['grecaptcha'] == null) {
      final apiJs = new ScriptElement();
      apiJs..type = 'text/javascript'
          ..src = 'https://www.google.com/recaptcha/api.js?render=explicit'
          ..async = true;

      document.body.children.add(apiJs);
    }

    // Rendering recaptcha after API is loaded
    document.onReadyStateChange.listen((_) {
      if(document.readyState == 'complete') {
        Element grecaptcha = querySelector('g-recaptcha');
        GRecaptcha.render(grecaptcha, jsify({
          'sitekey': sitekey,
          'theme': theme,
          'type': type,
          'size': size,
          'tabindex': tabindex,
          'callback': callback == null ? null : allowInterop(callback),
          'expired-callback': expiredCallback == null ? null : allowInterop(expiredCallback)
        }));
      }
    });
  }
}
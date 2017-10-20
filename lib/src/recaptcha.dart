import 'dart:html';
import 'dart:js';
import 'dart:js_util';

import 'package:angular/angular.dart';

import 'api.js.dart';
/// Angular Google ReCaptcha component
/// 
/// This component only adds recaptcha to your form.
/// You have to verify recaptcha response server-side as described here:
/// https://developers.google.com/recaptcha/docs/verify
/// 
/// Basic usage example:
/// 
///     <form>
///       <!-- Here are some form fields -->
///       <g-recaptcha sitekey="YOUR SITEKEY"></g-recaptcha>
///       <button type="submit">Submit</button>
///     </form>
/// 
/// Original information is here:
/// https://developers.google.com/recaptcha/docs/display#render_param 
/// 
/// Parameters:
/// 
/// - `sitekey: String` --  Your sitekey
/// - `theme: String` --  Optional. The color theme of the widget. Values: light | dark.
/// Default: light.
/// - `type: String`  --  Optional. The type of CAPTCHA to serve. Values: audio | image.
/// Default: image.
/// - `size: String`  --  Optional. The size of the widget. Values: compact | normal.
/// Default: normal.
/// - `tabindex: int` --  Optional. The tabindex of the widget and challenge. 
/// If other elements in your page use tabindex, it should be set to make user navigation easier.
/// Default: 0
/// - `callback: Function`  --  Optional. The name of your callback function to be executed
/// when the user submits a successful CAPTCHA response. The user's response, g-recaptcha-response,
/// will be the input for your callback function.
/// - `expired-callback: Function`  --  Optional. The name of your callback function to be executed
/// when the recaptcha response expires and the user needs to solve a new CAPTCHA.
@Component(
  selector: 'g-recaptcha',
  template: ''
)
class Recaptcha implements OnInit {
  @Input()
  String sitekey;
  @Input()
  String theme;
  @Input()
  String type;
  @Input()
  String size;
  @Input()
  int tabindex;
  @Input()
  Function callback;
  @Input('expired-callback')
  Function expiredCallback;

  @override
  void ngOnInit() {
    // Loading recaptcha API
    final apiJs = new ScriptElement();
    apiJs
      ..type = 'text/javascript'
      ..src = 'https://www.google.com/recaptcha/api.js?render=explicit'
      ..async = true;
    document.body.children.add(apiJs);

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
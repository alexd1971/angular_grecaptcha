# AngularDart Google ReCaptcha component

## Installation

Put following lines in pubspec.yaml:

```yaml
dependencies:
  angular_grecaptcha: ^0.0.4
```

then

```
pub get
```

## Basic usage

```dart
import 'package:angular_grecaptcha/angular_grecaptcha.dart';
...
@Component(
  selector: 'my-component',
  template: '''
    ...
    <form>
    ...
    <g-recaptcha sitekey="YOUR SITEKEY"></g-recaptcha>
    ...
    </form>
    ...
  ''',
  directives: const [AngularRecaptcha]
)
class MyComponent {}
```

Besides mandatory `sitekey` parameter you can add optional render parameters:
* `sitekey: String` --  Your sitekey
* `theme: String` --  Optional. The color theme of the widget. Values: light | dark. Default: light.
* `type: String`  --  Optional. The type of CAPTCHA to serve. Values: audio | image. Default: image.
* `size: String`  --  Optional. The size of the widget. Values: compact | normal. Default: normal.
* `tabindex: int` --  Optional. The tabindex of the widget and challenge.  If other elements in your page use tabindex, it should be set to make user navigation easier. Default: 0
* `callback: Function`  --  Optional. The name of your callback function to be executed when the user submits a successful CAPTCHA response. The user's response, g-recaptcha-response, will be the input for your callback function.
* `expired-callback: Function`  --  Optional. The name of your callback function to be executed when the recaptcha response expires and the user needs to solve a new CAPTCHA.

Original parameters description you can find [here](https://developers.google.com/recaptcha/docs/display#render_param)

## Advanced usage example

Advanced usage example you can find [here](https://gist.github.com/alexd1971/e973dc20abfddf29f4ea77eec7f84347)

## Important information

This component allows to get ReCaptcha response and post it to a back-end server, where the response is to be verified as described [here](https://developers.google.com/recaptcha/docs/verify). The component is not responsible for the verification.
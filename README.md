# AngularDart Google ReCaptcha component

## Installation

Put following lines in pubspec.yaml:

```yaml
dependencies:
  angular_grecaptcha:
    git: https://github.com/alexd1971/angular_grecaptcha.git
```

## Usage

Add to your component using recatcha:

```dart
import 'package:angular_grecaptcha/angular_grecaptcha.dart'
...
@Component(
  selector: 'my-component',
  template: '''
    ...
    <grecaptcha sitekey="YOUR SITE KEY"></grecaptcha>
    ...
  ''',
  directives: const [Recaptcha]
)
```
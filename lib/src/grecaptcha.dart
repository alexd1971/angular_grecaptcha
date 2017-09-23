import 'package:angular/angular.dart';

import 'dart:html';
import 'api_js.dart';

@Component(
  selector: 'grecaptcha',
  template: ''
)
class Recaptcha implements OnInit{
  @Input()
  String sitekey;
  @Input()
  String theme;
  @Input()
  String type;
  @Input()
  String size;

  @override
  void ngOnInit() {
    final apiJs = new ScriptElement();
    apiJs
      ..type = 'text/javascript'
      ..src = 'https://www.google.com/recaptcha/api.js?render=explicit'
      ..async = true;
    document.body.children.add(apiJs);
    document.onReadyStateChange.listen((_) {
      if(document.readyState == 'complete') {
        Element grecaptcha = querySelector('grecaptcha');
        GRecaptcha.render(grecaptcha, new Parameters(
          sitekey: sitekey,
          theme: theme,
          type: type,
          size: size
        ));
      }
    });
  }
}
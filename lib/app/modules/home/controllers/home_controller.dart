import 'dart:developer';

import 'package:get/get.dart';
import 'package:mustache_template/mustache_template.dart';

class HomeController extends GetxController {
  /// TODO: Temp function
  String generateCode() {
    var source = '''
	  {{# names }}
            <div>{{ lastname }}, {{ firstname }}</div>
	  {{/ names }}
	  {{^ names }}
	    <div>No names.</div>
	  {{/ names }}
	  {{! I am a comment. }}
	''';

    var template = new Template(source, name: 'template-filename.html');

    return template.renderString({
      'names': [
        {'firstname': 'Greg', 'lastname': 'Lowe'},
        {'firstname': 'Bob', 'lastname': 'Johnson'}
      ]
    });
  }

  void handleClick() {
    log(generateCode());
  }
}

import 'dart:developer';

const String blank = '.                                    ';

void ssPrint(value, String path, [String function = '', bool route = true]) {
  log('${_path(path, route)}${_function(function)}${_value(value)}\n$blank\n ');
}

String _path(String path, bool route) {
  if (route) {
    return '$path.dart\n';
  } else {
    return '$path\n';
  }
}

String _function(String function) {
  if (function == '') {
    return '';
  }

  return 'Function : $function\n';
}

String _value(value) {
  return '$value';
}

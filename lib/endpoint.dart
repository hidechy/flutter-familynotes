const endPointRoot = 'http://18.179.31.82/family_notes/public/api';

String getEndPoint({required String name}) {
  final endpoint = {
    'login': 'login',
    'signup': 'signup',
    'logout': 'logout',
    'codeConfirm': 'codeConfirm',
  };

  return '$endPointRoot/${endpoint[name]}';
}

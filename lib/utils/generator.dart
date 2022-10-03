import 'package:payme/utils/constants.dart';

String generateUri(String pa, {String? am, String? tm}) {
  var pn = "Siva";
  var uri = '$baseUrl?pa=$pa&pn=$pn';

  if (am != null) uri += '&am=$am';
  if (tm != null) uri += '&tm=$tm';

  return uri;
}

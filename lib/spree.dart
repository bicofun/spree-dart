import 'package:dotenv/dotenv.dart' show env;

class Spree {
  final String? url;

  Spree(this.url);
  Spree.prefix(String prefix)
      : assert(env['${prefix}_URL'] != null, '${prefix}_URL is null'),
        assert(env['${prefix}_URL']!.isNotEmpty, '${prefix}_URL is empty'),
        url = env['${prefix}_URL'];

  // APIAuthentication get authentication => APIAuthentication(this.url);
}

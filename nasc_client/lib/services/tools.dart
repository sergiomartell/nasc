import 'package:truncate/truncate.dart';

class Utils {
  static String abbreviate(String address) {
    return truncate(address, 10,
        omission: "...", position: TruncatePosition.middle);
  }
}

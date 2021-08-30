import 'package:foundation_identifiers/foundation_identifiers.dart';
import 'package:product_prayer_times/src/presentation/backdrop.dart';
import 'package:shared_launcher/shared_launcher.dart';
import 'package:shared_launcher/src/backdrop_widget.dart';

class PrayerTimesBackdropWidget implements RegisteredBackdropWidget {
  @override
  ProductIdentifier id = ProductIdentifier.PRAYER_TIMES;

  @override
  BackdropWidget widget = BackdropWidget(
    BackdropWidgetIdentifier.PRAYER_TIMES,
    () => Backdrop(),
  );
}

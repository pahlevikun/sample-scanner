import 'package:foundation_identifiers/foundation_identifiers.dart';
import 'package:product_prayer_times/src/presentation/sheet.dart';
import 'package:shared_launcher/shared_launcher.dart';
import 'package:shared_launcher/src/sheet_widget.dart';

class PrayerTimesSheetWidget implements RegisteredSheetWidget {
  @override
  ProductIdentifier id = ProductIdentifier.PRAYER_TIMES;

  @override
  SheetWidget widget = SheetWidget(
    SheetWidgetIdentifier.PRAYER_TIMES,
    () => Sheet(),
  );
}

import 'package:coin_gecko/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:coin_gecko/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:coin_gecko/ui/views/home/home_view.dart';
import 'package:coin_gecko/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:coin_gecko/services/coin_service.dart';
import 'package:coin_gecko/ui/views/coin_detail/coin_detail_view.dart';
import 'package:coin_gecko/ui/bottom_sheets/error/error_sheet.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: CoinDetailView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: CoinService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: ErrorSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
// @stacked-dialog
  ],
)
class App {}
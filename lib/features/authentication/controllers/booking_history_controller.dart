import 'package:batteryqk_web_app/data/services/booking_history_service.dart';
import 'package:batteryqk_web_app/features/authentication/models/bookinghistory/booking_model.dart';
import 'package:get/get.dart';

class BookingHistoryController extends GetxController {
  var isLoading = true.obs;
  var hasError = false.obs;
  var errorMessage = ''.obs;
  var bookingList = <BookingModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchBooking();
  }

  void fetchBooking() async {
    try {
      isLoading(true);
      hasError(false);
      bookingList.value = await BookingHistoryService.getBookings();
    } catch (e) {
      hasError(true);
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }
}

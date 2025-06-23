import 'package:batteryqk_web_app/data/services/booking_history_service.dart';
import 'package:batteryqk_web_app/features/authentication/models/bookinghistory/booking_model.dart';
import 'package:get/get.dart';

class BookingHistoryController extends GetxController{
      var isLoading = false.obs;
      var bookingList = <BookingModel>[].obs;

      @override
  void onInit() {
    super.onInit();
    fetchBooking();
  }

  void fetchBooking() async{
       try{
         isLoading(true);

         final userList = await BookingHistoryService.getBookings();

         if(userList.isNotEmpty){
           bookingList.value = userList;
           print('bookingList === $bookingList');
         }else{
           print('Booking list not found');
         }
       }catch(e){
         print('Error loading user: $e');
       }finally{
         isLoading.value = true;
       }
  }

}
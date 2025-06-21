import 'package:batteryqk_web_app/data/services/api_services.dart';
import 'package:batteryqk_web_app/features/authentication/models/build_listing_card_model.dart';
import 'package:get/get.dart';

class BuildListingCardController extends GetxController {
  final ApiService _apiService = ApiService();
  var listingCardData = <BuildListingCardModel>[].obs;
  var isloading = true.obs;
  var hasError = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    fetchListData();
    super.onInit();
  }

  Future<void> fetchListData() async {
    try {
      isloading(true);
      hasError(false);
      listingCardData.value = await _apiService.showListing();
    } catch (e) {
      hasError(true);
      errorMessage(e.toString());
    } finally {
      isloading(false);
    }
  }
}

import 'package:batteryqk_web_app/data/services/api_services.dart';
import 'package:batteryqk_web_app/features/authentication/models/build_listing_card_model.dart';
import 'package:get/get.dart';

class BuildListingCardController extends GetxController {
  final ApiService _apiService = ApiService();
  var listingCardData = <BuildListingCardModel>[].obs;
  var filteredListingData = <BuildListingCardModel>[].obs;

  var isloading = true.obs;
  var hasError = false.obs;
  var errorMessage = ''.obs;

  var selectedPriceType = 'All'.obs;
  var selectedCategory = 'All'.obs;

  @override
  void onInit() {
    Future.delayed(const Duration(milliseconds: 150), fetchListData);
    super.onInit();
  }

  void refreshForLanguage() {
    fetchListData();
  }

   Future<void> fetchListData() async {
    try {
      isloading(true);
      hasError(false);
      final data = await _apiService.showListing();
      listingCardData.value = data;
      filteredListingData.value = data;
      selectedPriceType.value = 'All';
      selectedCategory.value = 'All';
    } catch (e) {
      hasError(true);
      errorMessage.value = e.toString();
    } finally {
      isloading(false);
    }
  }
  void applyFilter({
    required String priceType,
    required String category,
    String searchTerm = '',
  }) {
    selectedPriceType.value = priceType;
    selectedCategory.value = category;

    filteredListingData.assignAll(
      listingCardData.where((item) {
        final matchPrice = (priceType == 'All' || priceType.isEmpty) || item.price == priceType;
        final matchCategory = (category == 'All' || category.isEmpty) || item.name == category;
        final matchSearch = searchTerm.isEmpty || item.name.toLowerCase().contains(searchTerm.toLowerCase());
        return matchPrice && matchCategory && matchSearch;
      }).toList(),
    );
  }
  Future<void> resetFilter() async {
    try {
      isloading(true);
      await Future.delayed(const Duration(milliseconds: 300));

      selectedPriceType.value = 'All';
      selectedCategory.value = 'All';

      if (listingCardData.isEmpty) {
        final data = await _apiService.showListing();
        listingCardData.value = data;
        filteredListingData.assignAll(data);
      } else {
        filteredListingData.assignAll(listingCardData);
      }
    } catch (e) {
      hasError(true);
      errorMessage.value = e.toString();
    } finally {
      isloading(false);
    }
  }
}

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

  // var selectedPriceType = 'All'.obs;
  // var selectedCategory = 'All'.obs;

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
      // selectedPriceType.value = 'All';
      // selectedCategory.value = 'All';
    } catch (e) {
      hasError(true);
      errorMessage.value = e.toString();
    } finally {
      isloading(false);
    }
  }

  void applyFilter({
    List<String>? mainCategories,
    List<String>? subCategories,
    List<String>? sports,
    String? location,
    String? ageGroup,
    String? rating,
    String? gender,
    String? price,
  }) {
    print('Filtering with:');
    print('mainCategories: $mainCategories');
    print('subCategories: $subCategories');
    print('sports: $sports');
    print('location: $location');
    print('ageGroup: $ageGroup');
    print('rating: $rating');
    print('gender: $gender');
    print('price: $price');

    filteredListingData.assignAll(
      listingCardData.where((item) {
        final matchMainCat =
            mainCategories == null || mainCategories.isEmpty
                ? true
                : mainCategories.contains(item.mainFeatures.trim());

        final matchSubCat =
            subCategories == null || subCategories.isEmpty
                ? true
                : subCategories.contains(item.mainSubCategories.trim());

        final matchSports =
            sports == null || sports.isEmpty
                ? true
                : sports.contains(item.allSprots.trim());

        final matchLocation =
            (location == null || location.isEmpty)
                ? true
                : item.location.trim().toLowerCase() ==
                    location.trim().toLowerCase();

        final matchAgeGroup =
            (ageGroup == null || ageGroup.isEmpty)
                ? true
                : item.ageGroup.isNotEmpty &&
                    item.ageGroup[0].trim().toLowerCase() ==
                        ageGroup.trim().toLowerCase();

        final matchRating =
            (rating == null || rating.isEmpty)
                ? true
                : item.averageRating.toString().trim() == rating.trim();

        final matchGender =
            (gender == null || gender.isEmpty)
                ? true
                : item.gender.trim().toLowerCase() ==
                    gender.trim().toLowerCase();

        final matchPrice =
            (price == null || price.isEmpty)
                ? true
                : item.price.trim() == price.trim();

        return matchMainCat &&
            matchSubCat &&
            matchSports &&
            matchLocation &&
            matchAgeGroup &&
            matchRating &&
            matchGender &&
            matchPrice;
      }).toList(),
    );

    print('Filtered results count: ${filteredListingData.length}');
  }

  // void applyFilter({
  //   required String priceType,
  //   required String category,
  //   String searchTerm = '',
  // }) {
  //   selectedPriceType.value = priceType;
  //   selectedCategory.value = category;

  //   filteredListingData.assignAll(
  //     listingCardData.where((item) {
  //       final matchPrice = (priceType == 'All' || priceType.isEmpty) || item.price == priceType;
  //       final matchCategory = (category == 'All' || category.isEmpty) || item.name == category;
  //       final matchSearch = searchTerm.isEmpty || item.name.toLowerCase().contains(searchTerm.toLowerCase());
  //       return matchPrice && matchCategory && matchSearch;
  //     }).toList(),
  //   );
  // }
  // Future<void> resetFilter() async {
  //   try {
  //     isloading(true);
  //     await Future.delayed(const Duration(milliseconds: 300));

  //     selectedPriceType.value = 'All';
  //     selectedCategory.value = 'All';

  //     if (listingCardData.isEmpty) {
  //       final data = await _apiService.showListing();
  //       listingCardData.value = data;
  //       filteredListingData.assignAll(data);
  //     } else {
  //       filteredListingData.assignAll(listingCardData);
  //     }
  //   } catch (e) {
  //     hasError(true);
  //     errorMessage.value = e.toString();
  //   } finally {
  //     isloading(false);
  //   }
  // }
}

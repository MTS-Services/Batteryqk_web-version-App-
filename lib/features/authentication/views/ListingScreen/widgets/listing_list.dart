import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/build_listing_card_controller.dart';
import '../../BookingScreen/book_screen.dart';
import '../../listings_details.dart';
import '../../../../../common/widgets/listings_details_custom/build_listing_card.dart';

class ListingsList extends StatelessWidget {
  final BuildListingCardController listController;
  const ListingsList({super.key, required this.listController});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (listController.filteredListingData.isEmpty) {
        return const Center(child: Text('No data found'));
      }

      return ListView.builder(
        itemCount: listController.filteredListingData.length,
        itemBuilder: (context, index) {
          final data = listController.filteredListingData[index];
          final ageGroup = data.ageGroup.isNotEmpty ? data.ageGroup[0] : '';

          return BuildListingCard(
            context: context,
            title: data.name,
            location: '${data.mainFeatures} | ${data.location}',
            tag: data.price,
            rating: 4.5,
            description: data.description,
            imageUrl: data.mainImage,
            averageRating: data.averageRating,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListingsDetails(
                    mainImage: data.mainImage,
                    title: data.name,
                    location: data.location,
                    tag: data.price,
                    description: data.description,
                    subImage1: data.subImage1,
                    subImage2: data.subImage2,
                    subImage3: data.subImage3,
                    subImage4: data.subImage4,
                    ageGroup: ageGroup,
                    facility: data.facilities.firstOrNull.toString(),
                    categoriesList: data.specificItemNames,
                    openingHours: data.operatingHours.firstOrNull.toString(),
                    reviews: data.reviews,
                    averageRating: data.averageRating,
                    numOfReviews: data.totalReviews,
                    index: data.id,
                  ),
                ),
              );
            },
            bookingOnPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookScreen(
                    listingId: data.id,
                    openingHours: data.operatingHours.firstOrNull.toString(),
                  ),
                ),
              );
            },
          );
        },
      );
    });
  }
}

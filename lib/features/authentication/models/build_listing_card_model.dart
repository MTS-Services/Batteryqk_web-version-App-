class BuildListingCardModel {
  String name;
  String mainFeatures;
  String location;
  String description;
  String price;
  String mainImage;
  String subImage1;
  String subImage2;
  String subImage3;
  String subImage4;
  List<String> ageGroup;
  List<String> facilities;
  List<String> operatingHours;
  List<String> specificItemNames;

  BuildListingCardModel({
    required this.name,
    required this.mainFeatures,
    required this.location,
    required this.description,
    required this.price,
    required this.mainImage,
    required this.subImage1,
    required this.subImage2,
    required this.subImage3,
    required this.subImage4,
    required this.ageGroup,
    required this.facilities,
    required this.operatingHours,
    required this.specificItemNames,
  });

  factory BuildListingCardModel.fromJson(Map<String, dynamic> json) {
    var selectedMainCategories = json['selectedMainCategories'] as List<dynamic>? ?? [];
    var subImagesList = json['sub_images'] as List<dynamic>? ?? [];
    String subImage1 = (subImagesList.isNotEmpty) ? subImagesList[0] as String : '';
    String subImage2 = (subImagesList.length > 1) ? subImagesList[1] as String : '';
    String subImage3 = (subImagesList.length > 2) ? subImagesList[2] as String : '';
    String subImage4 = (subImagesList.length > 3) ? subImagesList[3] as String : '';
    
    String mainFeatures = selectedMainCategories
        .map((category) => category['name'] as String? ?? '')
        .join(', ');

    var locationList = json['location'] as List<dynamic>? ?? [];    
    String location = locationList.join(', ');

    List<String> ageGroup = List<String>.from(json['agegroup'] ?? []);
    List<String> facilities = List<String>.from(json['facilities'] ?? []);
    List<String> operatingHours = List<String>.from(json['operatingHours'] ?? []);
 var selectedSpecificItems = json['selectedSpecificItems'] as List<dynamic>? ?? [];
    List<String> specificItemNames = selectedSpecificItems
        .map((item) => item['name'] as String? ?? '')
        .toList();
        // print(specificItemNames);

    return BuildListingCardModel(
      name: json['name'] as String? ?? '',
      mainFeatures: mainFeatures,
      location: location,
      description: json['description'] as String? ?? '',
      price: json['price'] as String? ?? '',
      mainImage: json['main_image'] as String? ?? '',
      subImage1: subImage1,
      subImage2: subImage2,
      subImage3: subImage3,
      subImage4: subImage4,
      ageGroup: ageGroup,
      facilities: facilities,
      operatingHours: operatingHours,
      specificItemNames: specificItemNames,  
    );
  }
}

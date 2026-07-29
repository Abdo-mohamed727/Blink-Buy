class ProductItemEntity {
  int id;
  String title;
  String description;
  String category;
  double price;
  double discountPercentage;
  double rating;
  int stock;
  List<String> tags;
  String brand;
  String sku;
  int weight;
  DimensionsEntity dimensions;
  String warrantyInformation;
  String shippingInformation;
  String availabilityStatus;
  List<ReviewsEntity> reviews;
  String returnPolicy;
  int minimumOrderQuantity;
  MetaEntity meta;
  List<String> images;
  String thumbnail;
  bool isFavorite ;

  ProductItemEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
    this.isFavorite=false,
  });

  ProductItemEntity copyWith({
    int? id,
    String? title,
    String? description,
    String? category,
    double? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    List<String>? tags,
    String? brand,
    String? sku,
    int? weight,
    DimensionsEntity? dimensions,
    String? warrantyInformation,
    String? shippingInformation,
    String? availabilityStatus,
    List<ReviewsEntity>? reviews,
    String? returnPolicy,
    int? minimumOrderQuantity,
    MetaEntity? meta,
    List<String>? images,
    String? thumbnail,
    bool? isFavorite,
  }) {
    return ProductItemEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      price: price ?? this.price,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      rating: rating ?? this.rating,
      stock: stock ?? this.stock,
      tags: tags ?? this.tags,
      brand: brand ?? this.brand,
      sku: sku ?? this.sku,
      weight: weight ?? this.weight,
      dimensions: dimensions ?? this.dimensions,
      warrantyInformation: warrantyInformation ?? this.warrantyInformation,
      shippingInformation: shippingInformation ?? this.shippingInformation,
      availabilityStatus: availabilityStatus ?? this.availabilityStatus,
      reviews: reviews ?? this.reviews,
      returnPolicy: returnPolicy ?? this.returnPolicy,
      minimumOrderQuantity: minimumOrderQuantity ?? this.minimumOrderQuantity,
      meta: meta ?? this.meta,
      images: images ?? this.images,
      thumbnail: thumbnail ?? this.thumbnail,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}


class DimensionsEntity {
  double width;
  double height;
  double depth;

  DimensionsEntity({
    required this.width,
    required this.height,
    required this.depth,
  });
}

class ReviewsEntity {
  int rating;
  String comment;
  String date;
  String reviewerName;
  String reviewerEmail;

  ReviewsEntity({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });
}

class MetaEntity {
  String createdAt;
  String updatedAt;
  String barcode;
  String qrCode;

  MetaEntity({required this.createdAt, required this.updatedAt, required this.barcode, required this.qrCode});


}

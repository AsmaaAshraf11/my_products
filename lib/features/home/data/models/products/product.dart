// features/home/data/models/products/product.dart
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';

import 'dimensions.dart';
import 'meta.dart';
import 'review.dart';

class Product extends ProductsEntity {
  int id;
  String title;
  String? description;
  String? category;
  double price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  int? weight;
  Dimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<Review> reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  Meta? meta;
  List<String>? images;
  String? thumbnail;

  Product({
    required this.id,
    required this.title,
    this.description,
    this.category,
    required this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    required this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  }) : super(
            image: thumbnail,
            titleProduct: title,
            descriptionProduct: description,
            Category: category,
            price: price,
            rating: rating,
            // review: reviews,
            productId: id);

  @override
  String toString() {
    return 'Product(id: $id, title: $title, description: $description, category: $category, price: $price, discountPercentage: $discountPercentage, rating: $rating, stock: $stock, tags: $tags, brand: $brand, sku: $sku, weight: $weight, dimensions: $dimensions, warrantyInformation: $warrantyInformation, shippingInformation: $shippingInformation, availabilityStatus: $availabilityStatus, reviews: $reviews, returnPolicy: $returnPolicy, minimumOrderQuantity: $minimumOrderQuantity, meta: $meta, images: $images, thumbnail: $thumbnail)';
  }

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as int,
        title: json['title'] as String,
        description: json['description'] as String,
        category: json['category'] as String,
        price: (json['price'] as num?)!.toDouble(),
        discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
        rating: (json['rating'] as num?)!.toDouble(),
        stock: json['stock'] as int,
        tags: (json['tags'] as List<dynamic>?)?.cast<String>(),
        brand: json['brand'] as String?,
        sku: json['sku'] as String?,
        weight: json['weight'] as int?,
        dimensions: json['dimensions'] == null
            ? null
            : Dimensions.fromJson(json['dimensions'] as Map<String, dynamic>),
        warrantyInformation: json['warrantyInformation'] as String,
        shippingInformation: json['shippingInformation'] as String,
        availabilityStatus: json['availabilityStatus'] as String,
        reviews: (json['reviews'] as List<dynamic>?)!
            .map((e) => Review.fromJson(e as Map<String, dynamic>))
            .toList(),
        returnPolicy: json['returnPolicy'] as String?,
        minimumOrderQuantity: json['minimumOrderQuantity'] as int?,
        meta: json['meta'] == null
            ? null
            : Meta.fromJson(json['meta'] as Map<String, dynamic>),
        // images: (json['images'] as List<dynamic>).cast<String>(),
        thumbnail: json['thumbnail'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'category': category,
        'price': price,
        'discountPercentage': discountPercentage,
        'rating': rating,
        'stock': stock,
        'tags': tags,
        'brand': brand,
        'sku': sku,
        'weight': weight,
        'dimensions': dimensions?.toJson(),
        'warrantyInformation': warrantyInformation,
        'shippingInformation': shippingInformation,
        'availabilityStatus': availabilityStatus,
        'reviews': reviews?.map((e) => e.toJson()).toList(),
        'returnPolicy': returnPolicy,
        'minimumOrderQuantity': minimumOrderQuantity,
        'meta': meta?.toJson(),
        'images': images,
        'thumbnail': thumbnail,
      };
}

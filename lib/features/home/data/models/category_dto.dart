import 'package:blinkbuy/features/home/domain/entity/category_intety.dart';

class CategoriesDto {
  List<CategoryBody>? list;

  CategoriesDto({this.list});

  CategoriesDto.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <CategoryBody>[];
      json['list'].forEach((v) {
        list!.add(CategoryBody.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  CategoriesEntity toEntity() {
    return CategoriesEntity(
      categories: list?.map((v) => v.toEntity()).toList() ?? [],
    );
  }
}

class CategoryBody {
  String? slug;
  String? name;
  String? url;
  String? image;

  CategoryBody({this.slug, this.name, this.url, this.image});

  CategoryBody.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    name = json['name'];
    url = json['url'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slug'] = this.slug;
    data['name'] = this.name;
    data['url'] = this.url;
    data['image'] = this.image;
    return data;
  }
  CategoryEntity toEntity() {
    return CategoryEntity(
      slug: slug!,
      name: name!,
      url: url!,
      image: image!,
    );
  }
}

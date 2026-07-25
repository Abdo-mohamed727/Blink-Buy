class CategoriesEntity {
  final List<CategoryEntity> categories;

  const CategoriesEntity({required this.categories});
}

class CategoryEntity {
  final String slug;
  final String name;
  final String url;
  final String image;

  const CategoryEntity({
    required this.slug,
    required this.name,
    required this.url,
    required this.image,
  });

  
}

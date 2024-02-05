class MenuItem {
  const MenuItem({
    required this.title,
    required this.images,
    required this.amount,
    required this.ratings,
    required this.cookingTime,
    required this.description,
  });

  final String title;
  final String images;
  final double amount;
  final double ratings;
  final int cookingTime;
  final String description;
}

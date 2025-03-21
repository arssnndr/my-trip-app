class Trip {
  final String title;
  final String photoUrl;
  final String price;
  final double rating;
  final String summary;
  final String includes; // Misalnya: "Makan, Akomodasi"
  final String excludes;
  final String termsAndConditions;
  final int totalPax;

  Trip({
    required this.title,
    required this.photoUrl,
    required this.price,
    required this.rating,
    required this.summary,
    required this.includes,
    required this.excludes,
    required this.termsAndConditions,
    required this.totalPax,
  });
}

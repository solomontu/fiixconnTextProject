class AppbarTextItemsModelModel {
   String name;
   bool isClicked;

  AppbarTextItemsModelModel({
    required this.name,
    required this.isClicked,
  });

  AppbarTextItemsModelModel copyWith({
    String? name,
    bool? isClicked,

  }) {
    return AppbarTextItemsModelModel(
      name: name ?? this.name,
      isClicked: isClicked ?? this.isClicked,
    );
  }
}

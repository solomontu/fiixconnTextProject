class ReactionButtonModel {
  String count;

  String iconName;

  ReactionButtonModel({
    required this.count,
    required this.iconName,
  });

  ReactionButtonModel copyWith({
    String? count,
    String? iconName,
  }) {
    return ReactionButtonModel(
      count: count ?? this.count,
      iconName: iconName ?? this.iconName,
    );
  }
}

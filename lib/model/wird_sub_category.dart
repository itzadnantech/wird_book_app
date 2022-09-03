import 'dart:ffi';

class Wird_Sub_Category {
  final String wird_cat_id;
  final String wird_sub_cat_id;
  final String wird_sub_cat_title;

  const Wird_Sub_Category({
    required this.wird_cat_id,
    required this.wird_sub_cat_id,
    required this.wird_sub_cat_title,
  });

  factory Wird_Sub_Category.fromJson(Map<String, dynamic> json) =>
      Wird_Sub_Category(
        wird_cat_id: json['wird_cat_id'],
        wird_sub_cat_id: json['wird_sub_cat_id'],
        wird_sub_cat_title: json['wird_sub_cat_title'],
      );

  Map<String, dynamic> toJson() => {
        'wird_cat_id': wird_cat_id,
        'wird_sub_cat_id': wird_sub_cat_id,
        'wird_sub_cat_title': wird_sub_cat_title,
      };
}

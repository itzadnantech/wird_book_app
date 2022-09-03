import 'dart:ffi';

class Sub_wird {
  final String wird_id;
  final int subwird_id;
  final String subwird;

  const Sub_wird({
    required this.wird_id,
    required this.subwird_id,
    required this.subwird,
  });

  factory Sub_wird.fromJson(Map<String, dynamic> json) => Sub_wird(
        wird_id: json['wird_id'],
        subwird_id: json['subwird_id'],
        subwird: json['subwird'],
      );

  Map<String, dynamic> toJson() => {
        'wird_id': wird_id,
        'subwird_id': subwird_id,
        'subwird': subwird,
      };
}

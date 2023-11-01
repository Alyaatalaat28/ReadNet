import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'item.dart';

class BookModel extends Equatable {
  final String? kind;
  final int? totalItems;
  final List<Item>? items;

  const BookModel({this.kind, this.totalItems, this.items});

  factory BookModel.fromMap(Map<String, dynamic> data) => BookModel(
        kind: data['kind'] as String?,
        totalItems: data['totalItems'] as int?,
        items: (data['items'] as List<dynamic>?)
            ?.map((e) => Item.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'kind': kind,
        'totalItems': totalItems,
        'items': items?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BookModel].
  factory BookModel.fromJson(String data) {
    return BookModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [BookModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [kind, totalItems, items];
}

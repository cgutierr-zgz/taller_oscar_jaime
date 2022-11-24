import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class Gif extends Equatable {
  const Gif({required this.image});

  final String image;

  factory Gif.fromJson(Map<String, dynamic> data)
    => Gif(image: data['images']['original']['url']);

  @override
  List<Object?> get props => [image];
}

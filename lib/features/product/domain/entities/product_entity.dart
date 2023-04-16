import 'package:equatable/equatable.dart';

class ProductItemEntity extends Equatable{
  final int id;
  final String? name;
  final String? imageUrl;
  final double? price;
  final bool? saved;

  const ProductItemEntity({
    required this.id,
    this.name,
    this.imageUrl,
    this.price,
    this.saved
  });


  @override
  List<Object?> get props => [
    id,
    name,
    imageUrl,
    price,
    saved
  ];
}

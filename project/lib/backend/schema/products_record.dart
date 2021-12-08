import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'products_record.g.dart';

abstract class ProductsRecord
    implements Built<ProductsRecord, ProductsRecordBuilder> {
  static Serializer<ProductsRecord> get serializer =>
      _$productsRecordSerializer;

  @nullable
  String get name;

  @nullable
  String get marque;

  @nullable
  double get prix;

  @nullable
  String get image;

  @nullable
  @BuiltValueField(wireName: 'Genre')
  String get genre;

  @nullable
  @BuiltValueField(wireName: 'Description')
  String get description;

  @nullable
  BuiltList<String> get taille;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ProductsRecordBuilder builder) => builder
    ..name = ''
    ..marque = ''
    ..prix = 0.0
    ..image = ''
    ..genre = ''
    ..description = ''
    ..taille = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ProductsRecord._();
  factory ProductsRecord([void Function(ProductsRecordBuilder) updates]) =
      _$ProductsRecord;

  static ProductsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createProductsRecordData({
  String name,
  String marque,
  double prix,
  String image,
  String genre,
  String description,
}) =>
    serializers.toFirestore(
        ProductsRecord.serializer,
        ProductsRecord((p) => p
          ..name = name
          ..marque = marque
          ..prix = prix
          ..image = image
          ..genre = genre
          ..description = description
          ..taille = null));

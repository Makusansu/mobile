import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'panier_record.g.dart';

abstract class PanierRecord
    implements Built<PanierRecord, PanierRecordBuilder> {
  static Serializer<PanierRecord> get serializer => _$panierRecordSerializer;

  @nullable
  String get image;

  @nullable
  String get name;

  @nullable
  double get prix;

  @nullable
  String get genre;

  @nullable
  String get taille;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PanierRecordBuilder builder) => builder
    ..image = ''
    ..name = ''
    ..prix = 0.0
    ..genre = ''
    ..taille = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Panier');

  static Stream<PanierRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PanierRecord._();
  factory PanierRecord([void Function(PanierRecordBuilder) updates]) =
      _$PanierRecord;

  static PanierRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPanierRecordData({
  String image,
  String name,
  double prix,
  String genre,
  String taille,
}) =>
    serializers.toFirestore(
        PanierRecord.serializer,
        PanierRecord((p) => p
          ..image = image
          ..name = name
          ..prix = prix
          ..genre = genre
          ..taille = taille));

// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again
// with `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'features/quotes/domain/entities/quote.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(1, 1822293919364040193),
      name: 'QuoteEntity',
      lastPropertyId: const obx_int.IdUid(7, 6283085748865241530),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 379386721806788110),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 5599098248522759498),
            name: 'author',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 8914587769958499913),
            name: 'content',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 831975983218538259),
            name: 'tags',
            type: 30,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 8746263388560836571),
            name: 'quoteId',
            type: 9,
            flags: 2080,
            indexId: const obx_int.IdUid(1, 1720969509568949836)),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(7, 6283085748865241530),
            name: 'isBookmarked',
            type: 1,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[])
];

/// Shortcut for [obx.Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [obx.Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
Future<obx.Store> openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) async {
  await loadObjectBoxLibraryAndroidCompat();
  return obx.Store(getObjectBoxModel(),
      directory: directory ?? (await defaultStoreDirectory()).path,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [obx.Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(1, 1822293919364040193),
      lastIndexId: const obx_int.IdUid(1, 1720969509568949836),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [6345181499658310691],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    QuoteEntity: obx_int.EntityDefinition<QuoteEntity>(
        model: _entities[0],
        toOneRelations: (QuoteEntity object) => [],
        toManyRelations: (QuoteEntity object) => {},
        getId: (QuoteEntity object) => object.id,
        setId: (QuoteEntity object, int id) {
          object.id = id;
        },
        objectToFB: (QuoteEntity object, fb.Builder fbb) {
          final authorOffset =
              object.author == null ? null : fbb.writeString(object.author!);
          final contentOffset =
              object.content == null ? null : fbb.writeString(object.content!);
          final tagsOffset = object.tags == null
              ? null
              : fbb.writeList(
                  object.tags!.map(fbb.writeString).toList(growable: false));
          final quoteIdOffset =
              object.quoteId == null ? null : fbb.writeString(object.quoteId!);
          fbb.startTable(8);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, authorOffset);
          fbb.addOffset(2, contentOffset);
          fbb.addOffset(3, tagsOffset);
          fbb.addOffset(5, quoteIdOffset);
          fbb.addBool(6, object.isBookmarked);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final quoteIdParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 14);
          final authorParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 6);
          final contentParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 8);
          final tagsParam = const fb.ListReader<String>(
                  fb.StringReader(asciiOptimization: true),
                  lazy: false)
              .vTableGetNullable(buffer, rootOffset, 10);
          final isBookmarkedParam =
              const fb.BoolReader().vTableGet(buffer, rootOffset, 16, false);
          final object = QuoteEntity(
              quoteId: quoteIdParam,
              author: authorParam,
              content: contentParam,
              tags: tagsParam,
              isBookmarked: isBookmarkedParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [QuoteEntity] entity fields to define ObjectBox queries.
class QuoteEntity_ {
  /// See [QuoteEntity.id].
  static final id =
      obx.QueryIntegerProperty<QuoteEntity>(_entities[0].properties[0]);

  /// See [QuoteEntity.author].
  static final author =
      obx.QueryStringProperty<QuoteEntity>(_entities[0].properties[1]);

  /// See [QuoteEntity.content].
  static final content =
      obx.QueryStringProperty<QuoteEntity>(_entities[0].properties[2]);

  /// See [QuoteEntity.tags].
  static final tags =
      obx.QueryStringVectorProperty<QuoteEntity>(_entities[0].properties[3]);

  /// See [QuoteEntity.quoteId].
  static final quoteId =
      obx.QueryStringProperty<QuoteEntity>(_entities[0].properties[4]);

  /// See [QuoteEntity.isBookmarked].
  static final isBookmarked =
      obx.QueryBooleanProperty<QuoteEntity>(_entities[0].properties[5]);
}

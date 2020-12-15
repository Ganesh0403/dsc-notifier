// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class Circular extends DataClass implements Insertable<Circular> {
  final int id;
  final String avatarUrl;
  final String channelName;
  final String authorName;
  final String date;
  final String imageUrl;
  final String textBody;
  final String fileCount;
  final String channelId;
  Circular(
      {@required this.id,
      @required this.avatarUrl,
      @required this.channelName,
      @required this.authorName,
      @required this.date,
      @required this.imageUrl,
      @required this.textBody,
      @required this.fileCount,
      @required this.channelId});
  factory Circular.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Circular(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      avatarUrl: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}avatar_url']),
      channelName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}channel_name']),
      authorName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}author_name']),
      date: stringType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      imageUrl: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}image_url']),
      textBody: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}text_body']),
      fileCount: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}file_count']),
      channelId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}channel_id']),
    );
  }
  factory Circular.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Circular(
      id: serializer.fromJson<int>(json['id']),
      avatarUrl: serializer.fromJson<String>(json['avatarUrl']),
      channelName: serializer.fromJson<String>(json['channelName']),
      authorName: serializer.fromJson<String>(json['authorName']),
      date: serializer.fromJson<String>(json['date']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      textBody: serializer.fromJson<String>(json['textBody']),
      fileCount: serializer.fromJson<String>(json['fileCount']),
      channelId: serializer.fromJson<String>(json['channelId']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'avatarUrl': serializer.toJson<String>(avatarUrl),
      'channelName': serializer.toJson<String>(channelName),
      'authorName': serializer.toJson<String>(authorName),
      'date': serializer.toJson<String>(date),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'textBody': serializer.toJson<String>(textBody),
      'fileCount': serializer.toJson<String>(fileCount),
      'channelId': serializer.toJson<String>(channelId),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Circular>>(bool nullToAbsent) {
    return CircularsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      avatarUrl: avatarUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(avatarUrl),
      channelName: channelName == null && nullToAbsent
          ? const Value.absent()
          : Value(channelName),
      authorName: authorName == null && nullToAbsent
          ? const Value.absent()
          : Value(authorName),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      textBody: textBody == null && nullToAbsent
          ? const Value.absent()
          : Value(textBody),
      fileCount: fileCount == null && nullToAbsent
          ? const Value.absent()
          : Value(fileCount),
      channelId: channelId == null && nullToAbsent
          ? const Value.absent()
          : Value(channelId),
    ) as T;
  }

  Circular copyWith(
          {int id,
          String avatarUrl,
          String channelName,
          String authorName,
          String date,
          String imageUrl,
          String textBody,
          String fileCount,
          String channelId}) =>
      Circular(
        id: id ?? this.id,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        channelName: channelName ?? this.channelName,
        authorName: authorName ?? this.authorName,
        date: date ?? this.date,
        imageUrl: imageUrl ?? this.imageUrl,
        textBody: textBody ?? this.textBody,
        fileCount: fileCount ?? this.fileCount,
        channelId: channelId ?? this.channelId,
      );
  @override
  String toString() {
    return (StringBuffer('Circular(')
          ..write('id: $id, ')
          ..write('avatarUrl: $avatarUrl, ')
          ..write('channelName: $channelName, ')
          ..write('authorName: $authorName, ')
          ..write('date: $date, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('textBody: $textBody, ')
          ..write('fileCount: $fileCount, ')
          ..write('channelId: $channelId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          avatarUrl.hashCode,
          $mrjc(
              channelName.hashCode,
              $mrjc(
                  authorName.hashCode,
                  $mrjc(
                      date.hashCode,
                      $mrjc(
                          imageUrl.hashCode,
                          $mrjc(
                              textBody.hashCode,
                              $mrjc(fileCount.hashCode,
                                  channelId.hashCode)))))))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Circular &&
          other.id == id &&
          other.avatarUrl == avatarUrl &&
          other.channelName == channelName &&
          other.authorName == authorName &&
          other.date == date &&
          other.imageUrl == imageUrl &&
          other.textBody == textBody &&
          other.fileCount == fileCount &&
          other.channelId == channelId);
}

class CircularsCompanion extends UpdateCompanion<Circular> {
  final Value<int> id;
  final Value<String> avatarUrl;
  final Value<String> channelName;
  final Value<String> authorName;
  final Value<String> date;
  final Value<String> imageUrl;
  final Value<String> textBody;
  final Value<String> fileCount;
  final Value<String> channelId;
  const CircularsCompanion({
    this.id = const Value.absent(),
    this.avatarUrl = const Value.absent(),
    this.channelName = const Value.absent(),
    this.authorName = const Value.absent(),
    this.date = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.textBody = const Value.absent(),
    this.fileCount = const Value.absent(),
    this.channelId = const Value.absent(),
  });
  CircularsCompanion copyWith(
      {Value<int> id,
      Value<String> avatarUrl,
      Value<String> channelName,
      Value<String> authorName,
      Value<String> date,
      Value<String> imageUrl,
      Value<String> textBody,
      Value<String> fileCount,
      Value<String> channelId}) {
    return CircularsCompanion(
      id: id ?? this.id,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      channelName: channelName ?? this.channelName,
      authorName: authorName ?? this.authorName,
      date: date ?? this.date,
      imageUrl: imageUrl ?? this.imageUrl,
      textBody: textBody ?? this.textBody,
      fileCount: fileCount ?? this.fileCount,
      channelId: channelId ?? this.channelId,
    );
  }
}

class $CircularsTable extends Circulars
    with TableInfo<$CircularsTable, Circular> {
  final GeneratedDatabase _db;
  final String _alias;
  $CircularsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _avatarUrlMeta = const VerificationMeta('avatarUrl');
  GeneratedTextColumn _avatarUrl;
  @override
  GeneratedTextColumn get avatarUrl => _avatarUrl ??= _constructAvatarUrl();
  GeneratedTextColumn _constructAvatarUrl() {
    return GeneratedTextColumn(
      'avatar_url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _channelNameMeta =
      const VerificationMeta('channelName');
  GeneratedTextColumn _channelName;
  @override
  GeneratedTextColumn get channelName =>
      _channelName ??= _constructChannelName();
  GeneratedTextColumn _constructChannelName() {
    return GeneratedTextColumn(
      'channel_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _authorNameMeta = const VerificationMeta('authorName');
  GeneratedTextColumn _authorName;
  @override
  GeneratedTextColumn get authorName => _authorName ??= _constructAuthorName();
  GeneratedTextColumn _constructAuthorName() {
    return GeneratedTextColumn(
      'author_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedTextColumn _date;
  @override
  GeneratedTextColumn get date => _date ??= _constructDate();
  GeneratedTextColumn _constructDate() {
    return GeneratedTextColumn(
      'date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _imageUrlMeta = const VerificationMeta('imageUrl');
  GeneratedTextColumn _imageUrl;
  @override
  GeneratedTextColumn get imageUrl => _imageUrl ??= _constructImageUrl();
  GeneratedTextColumn _constructImageUrl() {
    return GeneratedTextColumn(
      'image_url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _textBodyMeta = const VerificationMeta('textBody');
  GeneratedTextColumn _textBody;
  @override
  GeneratedTextColumn get textBody => _textBody ??= _constructTextBody();
  GeneratedTextColumn _constructTextBody() {
    return GeneratedTextColumn(
      'text_body',
      $tableName,
      false,
    );
  }

  final VerificationMeta _fileCountMeta = const VerificationMeta('fileCount');
  GeneratedTextColumn _fileCount;
  @override
  GeneratedTextColumn get fileCount => _fileCount ??= _constructFileCount();
  GeneratedTextColumn _constructFileCount() {
    return GeneratedTextColumn(
      'file_count',
      $tableName,
      false,
    );
  }

  final VerificationMeta _channelIdMeta = const VerificationMeta('channelId');
  GeneratedTextColumn _channelId;
  @override
  GeneratedTextColumn get channelId => _channelId ??= _constructChannelId();
  GeneratedTextColumn _constructChannelId() {
    return GeneratedTextColumn(
      'channel_id',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        avatarUrl,
        channelName,
        authorName,
        date,
        imageUrl,
        textBody,
        fileCount,
        channelId
      ];
  @override
  $CircularsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'circulars';
  @override
  final String actualTableName = 'circulars';
  @override
  VerificationContext validateIntegrity(CircularsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.avatarUrl.present) {
      context.handle(_avatarUrlMeta,
          avatarUrl.isAcceptableValue(d.avatarUrl.value, _avatarUrlMeta));
    } else if (avatarUrl.isRequired && isInserting) {
      context.missing(_avatarUrlMeta);
    }
    if (d.channelName.present) {
      context.handle(_channelNameMeta,
          channelName.isAcceptableValue(d.channelName.value, _channelNameMeta));
    } else if (channelName.isRequired && isInserting) {
      context.missing(_channelNameMeta);
    }
    if (d.authorName.present) {
      context.handle(_authorNameMeta,
          authorName.isAcceptableValue(d.authorName.value, _authorNameMeta));
    } else if (authorName.isRequired && isInserting) {
      context.missing(_authorNameMeta);
    }
    if (d.date.present) {
      context.handle(
          _dateMeta, date.isAcceptableValue(d.date.value, _dateMeta));
    } else if (date.isRequired && isInserting) {
      context.missing(_dateMeta);
    }
    if (d.imageUrl.present) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableValue(d.imageUrl.value, _imageUrlMeta));
    } else if (imageUrl.isRequired && isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (d.textBody.present) {
      context.handle(_textBodyMeta,
          textBody.isAcceptableValue(d.textBody.value, _textBodyMeta));
    } else if (textBody.isRequired && isInserting) {
      context.missing(_textBodyMeta);
    }
    if (d.fileCount.present) {
      context.handle(_fileCountMeta,
          fileCount.isAcceptableValue(d.fileCount.value, _fileCountMeta));
    } else if (fileCount.isRequired && isInserting) {
      context.missing(_fileCountMeta);
    }
    if (d.channelId.present) {
      context.handle(_channelIdMeta,
          channelId.isAcceptableValue(d.channelId.value, _channelIdMeta));
    } else if (channelId.isRequired && isInserting) {
      context.missing(_channelIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Circular map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Circular.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(CircularsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.avatarUrl.present) {
      map['avatar_url'] = Variable<String, StringType>(d.avatarUrl.value);
    }
    if (d.channelName.present) {
      map['channel_name'] = Variable<String, StringType>(d.channelName.value);
    }
    if (d.authorName.present) {
      map['author_name'] = Variable<String, StringType>(d.authorName.value);
    }
    if (d.date.present) {
      map['date'] = Variable<String, StringType>(d.date.value);
    }
    if (d.imageUrl.present) {
      map['image_url'] = Variable<String, StringType>(d.imageUrl.value);
    }
    if (d.textBody.present) {
      map['text_body'] = Variable<String, StringType>(d.textBody.value);
    }
    if (d.fileCount.present) {
      map['file_count'] = Variable<String, StringType>(d.fileCount.value);
    }
    if (d.channelId.present) {
      map['channel_id'] = Variable<String, StringType>(d.channelId.value);
    }
    return map;
  }

  @override
  $CircularsTable createAlias(String alias) {
    return $CircularsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $CircularsTable _circulars;
  $CircularsTable get circulars => _circulars ??= $CircularsTable(this);
  @override
  List<TableInfo> get allTables => [circulars];
}

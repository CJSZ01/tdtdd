// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_task_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarTaskModelCollection on Isar {
  IsarCollection<IsarTaskModel> get isarTaskModels => this.collection();
}

const IsarTaskModelSchema = CollectionSchema(
  name: r'IsarTaskModel',
  id: 6739768532344051055,
  properties: {
    r'check': PropertySchema(
      id: 0,
      name: r'check',
      type: IsarType.bool,
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    )
  },
  estimateSize: _isarTaskModelEstimateSize,
  serialize: _isarTaskModelSerialize,
  deserialize: _isarTaskModelDeserialize,
  deserializeProp: _isarTaskModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _isarTaskModelGetId,
  getLinks: _isarTaskModelGetLinks,
  attach: _isarTaskModelAttach,
  version: '3.1.0',
);

int _isarTaskModelEstimateSize(
  IsarTaskModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.description.length * 3;
  return bytesCount;
}

void _isarTaskModelSerialize(
  IsarTaskModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.check);
  writer.writeString(offsets[1], object.description);
}

IsarTaskModel _isarTaskModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarTaskModel();
  object.check = reader.readBool(offsets[0]);
  object.description = reader.readString(offsets[1]);
  object.id = id;
  return object;
}

P _isarTaskModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarTaskModelGetId(IsarTaskModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarTaskModelGetLinks(IsarTaskModel object) {
  return [];
}

void _isarTaskModelAttach(
    IsarCollection<dynamic> col, Id id, IsarTaskModel object) {
  object.id = id;
}

extension IsarTaskModelQueryWhereSort
    on QueryBuilder<IsarTaskModel, IsarTaskModel, QWhere> {
  QueryBuilder<IsarTaskModel, IsarTaskModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarTaskModelQueryWhere
    on QueryBuilder<IsarTaskModel, IsarTaskModel, QWhereClause> {
  QueryBuilder<IsarTaskModel, IsarTaskModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarTaskModel, IsarTaskModel, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarTaskModel, IsarTaskModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarTaskModel, IsarTaskModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarTaskModel, IsarTaskModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarTaskModelQueryFilter
    on QueryBuilder<IsarTaskModel, IsarTaskModel, QFilterCondition> {
  QueryBuilder<IsarTaskModel, IsarTaskModel, QAfterFilterCondition>
      checkEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'check',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTaskModel, IsarTaskModel, QAfterFilterCondition>
      descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTaskModel, IsarTaskModel, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTaskModel, IsarTaskModel, QAfterFilterCondition>
      descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTaskModel, IsarTaskModel, QAfterFilterCondition>
      descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTaskModel, IsarTaskModel, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTaskModel, IsarTaskModel, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTaskModel, IsarTaskModel, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTaskModel, IsarTaskModel, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarTaskModel, IsarTaskModel, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarTaskModel, IsarTaskModel, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarTaskModel, IsarTaskModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTaskModel, IsarTaskModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTaskModel, IsarTaskModel, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarTaskModel, IsarTaskModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarTaskModelQueryObject
    on QueryBuilder<IsarTaskModel, IsarTaskModel, QFilterCondition> {}

extension IsarTaskModelQueryLinks
    on QueryBuilder<IsarTaskModel, IsarTaskModel, QFilterCondition> {}

extension IsarTaskModelQuerySortBy
    on QueryBuilder<IsarTaskModel, IsarTaskModel, QSortBy> {
  QueryBuilder<IsarTaskModel, IsarTaskModel, QAfterSortBy> sortByCheck() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'check', Sort.asc);
    });
  }

  QueryBuilder<IsarTaskModel, IsarTaskModel, QAfterSortBy> sortByCheckDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'check', Sort.desc);
    });
  }

  QueryBuilder<IsarTaskModel, IsarTaskModel, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<IsarTaskModel, IsarTaskModel, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }
}

extension IsarTaskModelQuerySortThenBy
    on QueryBuilder<IsarTaskModel, IsarTaskModel, QSortThenBy> {
  QueryBuilder<IsarTaskModel, IsarTaskModel, QAfterSortBy> thenByCheck() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'check', Sort.asc);
    });
  }

  QueryBuilder<IsarTaskModel, IsarTaskModel, QAfterSortBy> thenByCheckDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'check', Sort.desc);
    });
  }

  QueryBuilder<IsarTaskModel, IsarTaskModel, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<IsarTaskModel, IsarTaskModel, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<IsarTaskModel, IsarTaskModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarTaskModel, IsarTaskModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension IsarTaskModelQueryWhereDistinct
    on QueryBuilder<IsarTaskModel, IsarTaskModel, QDistinct> {
  QueryBuilder<IsarTaskModel, IsarTaskModel, QDistinct> distinctByCheck() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'check');
    });
  }

  QueryBuilder<IsarTaskModel, IsarTaskModel, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }
}

extension IsarTaskModelQueryProperty
    on QueryBuilder<IsarTaskModel, IsarTaskModel, QQueryProperty> {
  QueryBuilder<IsarTaskModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarTaskModel, bool, QQueryOperations> checkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'check');
    });
  }

  QueryBuilder<IsarTaskModel, String, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }
}

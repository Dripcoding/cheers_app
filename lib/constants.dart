// ignore_for_file: constant_identifier_names
enum ROUTES {
  HOME('/'),
  SEARCH('/search'),
  LIST('/list');

  final String path;

  const ROUTES(this.path);
}

enum BREWERY_TYPES {
  MICRO('micro'),
  NANO('nano'),
  REGIONAL('regional'),
  BREWPUB('brewpub'),
  LARGE('Large'),
  PLANNING('planning'),
  BAR('bar'),
  CONTRACT('contract'),
  PROPRIETOR('proprietor'),
  CLOSED('closed');

  final String type;

  const BREWERY_TYPES(this.type);
}

extension BreweryTypesExtension on BREWERY_TYPES {
  static const List<BREWERY_TYPES> values = [
    BREWERY_TYPES.MICRO,
    BREWERY_TYPES.NANO,
    BREWERY_TYPES.REGIONAL,
    BREWERY_TYPES.BREWPUB,
    BREWERY_TYPES.LARGE,
    BREWERY_TYPES.PLANNING,
    BREWERY_TYPES.BAR,
    BREWERY_TYPES.CONTRACT,
    BREWERY_TYPES.PROPRIETOR,
    BREWERY_TYPES.CLOSED,
  ];

  static List<String> get types => values.map((e) => e.type).toList();
}

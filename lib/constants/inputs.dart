enum InputNames {
  city('by_city'),
  state('by_state'),
  country('by_country'),
  postal('by_postal'),
  type('by_type'),
  breweryName('by_name'),
  sort('sort'),
  numberOfBreweries('per_page');

  const InputNames(this.name);

  final String name;
}

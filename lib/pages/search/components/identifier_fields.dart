import 'package:flutter/material.dart';

class IdentifierFields extends StatefulWidget {
  const IdentifierFields({super.key = const Key('identifier_inputs')});

  @override
  State<IdentifierFields> createState() => _IdentifierFieldsState();
}

class _IdentifierFieldsState extends State<IdentifierFields> {
  String? _selectedType;
  String? _selectedName;

  final List<String> types = ['Type1', 'Type2', 'Type3'];
  final List<String> names = ['Name1', 'Name2', 'Name3'];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DropdownButtonFormField<String>(
          key: const Key('by_type_input'),
          decoration: const InputDecoration(labelText: 'Type'),
          value: _selectedType,
          items:
              types
                  .map(
                    (type) => DropdownMenuItem(value: type, child: Text(type)),
                  )
                  .toList(),
          onChanged: (value) {
            setState(() {
              _selectedType = value;
            });
          },
        ),
        DropdownButtonFormField<String>(
          key: const Key('by_name_input'),
          decoration: const InputDecoration(labelText: 'Name'),
          value: _selectedName,
          items:
              names
                  .map(
                    (name) => DropdownMenuItem(value: name, child: Text(name)),
                  )
                  .toList(),
          onChanged: (value) {
            setState(() {
              _selectedName = value;
            });
          },
        ),
      ],
    );
  }
}

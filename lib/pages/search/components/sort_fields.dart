import 'package:flutter/material.dart';

class SortFields extends StatefulWidget {
  const SortFields({super.key = const Key('sort_fields')});

  @override
  State<SortFields> createState() => _SortFieldsState();
}

class _SortFieldsState extends State<SortFields> {
  String? _sortOrder;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          flex: 1,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 150, maxHeight: 200),
            child: TextFormField(
              key: const Key('number_input'),
              decoration: const InputDecoration(labelText: 'Number'),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Column(
            key: const Key('sort_order_input'),
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 150,
                  maxHeight: 200,
                ),
                child: RadioListTile<String>(
                  title: const Text('asc'),
                  value: 'asc',
                  groupValue: _sortOrder,
                  onChanged: (value) {
                    setState(() {
                      _sortOrder = value;
                    });
                  },
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 150,
                  maxHeight: 200,
                ),
                child: RadioListTile<String>(
                  title: const Text('desc'),
                  value: 'desc',
                  groupValue: _sortOrder,
                  onChanged: (value) {
                    setState(() {
                      _sortOrder = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

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
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          child: TextFormField(
            key: const Key('number_input'),
            decoration: const InputDecoration(labelText: 'Number'),
          ),
        ),
        SizedBox(
          width: 200,
          child: Column(
            key: const Key('sort_order_input'),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Sort Order',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              RadioListTile<String>(
                title: const Text('asc'),
                value: 'asc',
                groupValue: _sortOrder,
                onChanged: (value) {
                  setState(() {
                    _sortOrder = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('desc'),
                value: 'desc',
                groupValue: _sortOrder,
                onChanged: (value) {
                  setState(() {
                    _sortOrder = value;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final flutterStateManagement =
    Provider((_) => 'Flutter state management with Riverpod');

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(flutterStateManagement);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Revirpod State Management')),
        body: Center(
          child: Text(value),
        ),
      ),
    );
  }
}

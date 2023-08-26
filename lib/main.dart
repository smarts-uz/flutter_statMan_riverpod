import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: RandomNumberApp()));
}

class RandomNumberGenerator extends StateNotifier<int> {
  RandomNumberGenerator() : super(Random().nextInt(5));

  void generate() {
    state = Random().nextInt(5);
  }
}

final randomNumberProvider = StateNotifierProvider(
  (ref) => RandomNumberGenerator(),
);

class RandomNumberApp extends StatelessWidget {
  const RandomNumberApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Random number'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const RandomConsumer(),
              Consumer(
                builder: (context, ref, child) {
                  return SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      child: const Text('Generate'),
                      onPressed: () =>
                          ref.read(randomNumberProvider.notifier).generate(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RandomConsumer extends ConsumerWidget {
  const RandomConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      ref.watch(randomNumberProvider).toString(),
      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}

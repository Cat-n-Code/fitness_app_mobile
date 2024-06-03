import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scaffold_messenger.g.dart';

@riverpod
GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey(
  ScaffoldMessengerKeyRef ref,
) =>
    GlobalKey();

@riverpod
ScaffoldMessengerState scaffoldMessenger(ScaffoldMessengerRef ref) =>
    ref.watch(scaffoldMessengerKeyProvider).currentState!;

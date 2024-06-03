import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/providers/app_key.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale.g.dart';

@riverpod
Option<Locale> locale(LocaleRef ref) {
  final context = ref.watch(appKeyProvider).currentContext;
  return Option.fromNullable(context).flatMapNullable(
    (context) => EasyLocalization.of(context)?.locale,
  );
}

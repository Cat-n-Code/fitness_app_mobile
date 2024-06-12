import 'package:fitness_app/app.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_key.g.dart';

@Riverpod(keepAlive: true)
GlobalKey<AppState> appKey(AppKeyRef ref) => GlobalKey();

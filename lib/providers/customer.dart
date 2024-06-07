import 'dart:convert';

import 'package:fitness_app/models/users.dart';
import 'package:fitness_app/utils/api.dart';
import 'package:fitness_app/utils/error_presenter.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'customer.g.dart';

@riverpod
Future<Customer> customerById(CustomerByIdRef ref, int id) async {
  final result = await apiFetch(HttpMethod.get, '/customers/$id');

  switch (result) {
    case Left(value: final response):
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      return Customer.fromJson(data);
    case Right(value: final exception):
      presentError(exception, ref: ref);
      throw exception;
  }
}

@riverpod
Future<List<Customer>> myCustomers(
  MyCustomersRef ref,
  int page,
  int count,
) async {
  final result = await apiFetch(
    HttpMethod.get,
    '/coaches/my_customers',
    ref: ref,
    params: {'page': page.toString(), 'size': count.toString()},
  );

  switch (result) {
    case Left(value: final response):
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      final list = data as List<Map<String, Object?>>;
      return list.map((d) => Customer.fromJson(d)).toList();
    case Right(value: final exception):
      presentError(exception, ref: ref);
      throw exception;
  }
}

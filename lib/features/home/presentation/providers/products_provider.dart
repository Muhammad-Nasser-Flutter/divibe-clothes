import 'package:cloth_ecommerce/features/home/data/repositories/products_repository.dart';
import 'package:cloth_ecommerce/features/home/presentation/providers/products_notifier.dart';
import 'package:cloth_ecommerce/features/home/presentation/providers/products_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for ProductsRepository
final productsRepositoryProvider = Provider<ProductsRepository>((ref) {
  return ProductsRepository();
});

/// Provider for ProductsNotifier with auto-dispose
final productsNotifierProvider = StateNotifierProvider.autoDispose<ProductsNotifier, ProductsState>((ref) {
  final repository = ref.watch(productsRepositoryProvider);
  return ProductsNotifier(repository);
});

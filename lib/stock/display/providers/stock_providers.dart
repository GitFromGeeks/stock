import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stocks/core/networking/custom_exception.dart';
import 'package:stocks/core/shared/type_defs.dart';
import 'package:stocks/stock/domain/entity/stock_entity.dart';
import 'package:stocks/stock/domain/usecase/use_stock_repository.dart';

final stocksFutureProvider =
    FutureProvider.family<Either<CustomException, List<Stock>?>?, String>(
      (ref, stk) async => await ref
          .watch(stocksMarketNotifierProvider.notifier)
          .getStocks(params: {"query": stk}),
    );

final stocksMarketNotifierProvider = NotifierProvider<
  StocksMarketNotifier,
  Either<CustomException, List<Stock>?>
>(() => StocksMarketNotifier());

class StocksMarketNotifier
    extends Notifier<Either<CustomException, List<Stock>?>> {
  Either<CustomException, List<Stock>?> initialState = Right(null);
  @override
  Either<CustomException, List<Stock>?> build() {
    return initialState;
  }

  Future<Either<CustomException, List<Stock>?>?> getStocks({
    JSON? params,
  }) async {
    return await ref
        .watch(stockRepositoryUseCaseProvider)
        .getStocks(params: params);
  }
}

final stockDetailsFutureProvider =
    FutureProvider.family<Either<CustomException, Stock?>?, String>(
      (ref, stk) async => await ref
          .watch(stockDetailNotifierProvider.notifier)
          .getStockDetails(params: {"id": stk}),
    );

final stockDetailNotifierProvider =
    NotifierProvider<StockDetailNotifier, Either<CustomException, Stock?>>(
      () => StockDetailNotifier(),
    );

class StockDetailNotifier extends Notifier<Either<CustomException, Stock?>> {
  Either<CustomException, Stock?> initialState = Right(null);
  @override
  Either<CustomException, Stock?> build() {
    return initialState;
  }

  Future<Either<CustomException, Stock?>?> getStockDetails({
    JSON? params,
  }) async {
    return await ref
        .watch(stockRepositoryUseCaseProvider)
        .getStockDetails(params: params);
  }
}

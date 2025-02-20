import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' show Provider;
import 'package:stocks/core/networking/custom_exception.dart';
import 'package:stocks/core/shared/type_defs.dart';
import 'package:stocks/stock/data/repository/stock_repository_impl.dart';
import 'package:stocks/stock/domain/entity/stock_entity.dart';
import 'package:stocks/stock/domain/repository/stocks_repository.dart';

final stockRepositoryUseCaseProvider = Provider<UseStockRepository>((ref) {
  return UseStockRepository(ref.watch(stockRepositoryProvider));
});

class UseStockRepository {
  final StocksRepository repository;
  UseStockRepository(this.repository);

  Future<Either<CustomException, List<Stock>?>?> getStocks({
    JSON? params,
  }) async => repository.getStocks(params: params);

  Future<Either<CustomException, Stock?>?> getStockDetails({
    JSON? params,
  }) async => repository.getStockDetails(params: params);
}

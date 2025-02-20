import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' show Provider;
import 'package:stocks/core/networking/custom_exception.dart';
import 'package:stocks/core/shared/type_defs.dart';
import 'package:stocks/stock/data/dataSource/stock_remote_source.dart';
import 'package:stocks/stock/domain/entity/stock_entity.dart';
import 'package:stocks/stock/domain/repository/stocks_repository.dart';

final stockRepositoryProvider = Provider<StockRepositoryImpl>((ref) {
  return StockRepositoryImpl(remote: ref.watch(stockRemoteSourceProvider));
});

class StockRepositoryImpl extends StocksRepository {
  final StockRemoteSource remote;
  StockRepositoryImpl({required this.remote});

  @override
  Future<Either<CustomException, List<Stock>?>?> getStocks({
    JSON? params,
  }) async {
    try {
      return Right(await remote.getStocks(params: params));
    } on CustomException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<CustomException, Stock?>?> getStockDetails({
    JSON? params,
  }) async {
    try {
      return Right(await remote.getStockDetails(params: params));
    } on CustomException catch (e) {
      return Left(e);
    }
  }
}

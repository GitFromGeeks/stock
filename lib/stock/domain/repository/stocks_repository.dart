import 'package:dartz/dartz.dart';
import 'package:stocks/core/networking/custom_exception.dart';
import 'package:stocks/core/shared/type_defs.dart';
import 'package:stocks/stock/domain/entity/stock_entity.dart';

abstract class StocksRepository {
  Future<Either<CustomException, List<Stock>?>?> getStocks({JSON? params});
  Future<Either<CustomException, Stock?>?> getStockDetails({JSON? params});
}

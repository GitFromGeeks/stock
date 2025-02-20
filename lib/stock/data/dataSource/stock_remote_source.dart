import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart' show Provider;
import 'package:stocks/core/networking/api_endpoint.dart';
import 'package:stocks/core/networking/api_provider.dart';
import 'package:stocks/core/networking/api_service.dart';
import 'package:stocks/core/networking/custom_exception.dart';
import 'package:stocks/core/shared/type_defs.dart';
import 'package:stocks/stock/data/models/stock_model.dart';
import 'package:stocks/stock/domain/entity/stock_entity.dart';

final stockRemoteSourceProvider = Provider<StockRemoteSourceImpl>((ref) {
  return StockRemoteSourceImpl(remote: ref.watch(apiServiceProvider));
});

abstract class StockRemoteSource {
  Future<List<Stock>?> getStocks({JSON? params});
  Future<Stock?> getStockDetails({JSON? params});
}

class StockRemoteSourceImpl implements StockRemoteSource {
  final ApiService remote;
  StockRemoteSourceImpl({required this.remote});

  @override
  Future<List<Stock>?> getStocks({JSON? params}) async {
    try {
      var response = await remote.getCollectionData(
        endpoint: ApiEndpoint.stocks(StockEndpoint.SEARCH_STOCK),
        queryParams: params,
        converter: StockModel.fromMap,
      );
      return response.body;
    } catch (e, st) {
      log("$st");
      throw CustomException(message: e.toString());
    }
  }

  @override
  Future<Stock?> getStockDetails({JSON? params}) async {
    try {
      var response = await remote.getDocumentData(
        endpoint: ApiEndpoint.stocks(StockEndpoint.BASE) + params!["id"],
        converter: StockModel.fromMap,
      );
      return response.body;
    } catch (e, st) {
      log("$st");
      throw CustomException(message: e.toString());
    }
  }
}

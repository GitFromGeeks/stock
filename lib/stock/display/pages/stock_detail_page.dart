import 'package:flutter/material.dart';
import 'package:stocks/core/helpers/constants/app_colors.dart';
import 'package:stocks/core/helpers/constants/app_typography.dart';
import 'package:stocks/stock/domain/entity/stock_entity.dart';

class StockDetailPage extends StatelessWidget {
  final Stock stock;

  const StockDetailPage({super.key, required this.stock});

  Widget detailedTileWidget(String title, String? value) {
    return ListTile(
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(value ?? 'N/A'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            iconTheme: IconThemeData(color: AppColors.white),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                stock.name ?? '',
                style: AppTypography.primary.body16.copyWith(
                  color: AppColors.white,
                ),
              ),
              background:
                  stock.image != null && stock.image!.url != null
                      ? Image.network(stock.image!.url!, fit: BoxFit.cover)
                      : Container(color: Colors.grey),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'General Information',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              detailedTileWidget('Name', stock.name),
              detailedTileWidget('Symbol', stock.symbol),
              detailedTileWidget('Exchange', stock.exchange),
              detailedTileWidget('Asset Type', stock.assetType),
              detailedTileWidget('ISIN', stock.isin),
              detailedTileWidget(
                'Listing Date',
                stock.listingDate?.toLocal().toString(),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Description',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(stock.description ?? 'No description available.'),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Sustainability & Emissions',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              detailedTileWidget('Net Zero Progress', stock.netZeroProgress),
              detailedTileWidget(
                'Carbon Intensity Scope 3',
                stock.carbonIntensityScope3?.toString(),
              ),
              detailedTileWidget(
                'Carbon Intensity Scope 1 & 2',
                stock.carbonIntensityScope1And2?.toString(),
              ),
              detailedTileWidget(
                'Carbon Intensity (All Scopes)',
                stock.carbonIntensityScope1And2And3?.toString(),
              ),
              detailedTileWidget(
                'Scope 1 Emissions',
                stock.scope1Emissions?.toString(),
              ),
              detailedTileWidget(
                'Scope 2 Emissions',
                stock.scope2Emissions?.toString(),
              ),
              detailedTileWidget(
                'Scope 3 Emissions',
                stock.scope3Emissions?.toString(),
              ),
              detailedTileWidget(
                'Total Emissions',
                stock.totalEmissions?.toString(),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Additional Information',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              detailedTileWidget('Website', stock.website),
              detailedTileWidget('Address', stock.address),
              detailedTileWidget('Industry', stock.industry),
              detailedTileWidget('Sector', stock.sector),
              detailedTileWidget('Employees', stock.employees?.toString()),
              detailedTileWidget('Market Cap', stock.marketCap),
              detailedTileWidget('Alpaca ID', stock.alpacaId),
              detailedTileWidget(
                'IBKR Connection ID',
                stock.ibkrConnectionId?.toString(),
              ),
              // Dates
              detailedTileWidget(
                'Created At',
                stock.createdAt?.toLocal().toString(),
              ),
              detailedTileWidget(
                'Updated At',
                stock.updatedAt?.toLocal().toString(),
              ),
              SizedBox(height: 32.0),
            ]),
          ),
        ],
      ),
    );
  }
}

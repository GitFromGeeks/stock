import 'package:flutter/material.dart';
import 'package:stocks/core/config/routes/app_router.dart';
import 'package:stocks/core/config/routes/routes.dart';
import 'package:stocks/core/helpers/constants/app_colors.dart';
import 'package:stocks/core/helpers/constants/app_styles.dart';
import 'package:stocks/core/shared/widgets/custom_network_image.dart';
import 'package:stocks/stock/domain/entity/stock_entity.dart';

class StockCard extends StatelessWidget {
  final Stock stock;

  const StockCard({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          AppRouter.pushNamed(Routes.stockDetails, args: {"stock": stock});
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: Corners.rounded15,
            color: AppColors.lightBackgroundColor,
            boxShadow: [BoxShadow(spreadRadius: 2, blurRadius: 2)],
          ),

          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (stock.image?.url != null)
                    ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CustomNetworkImage(
                        imageUrl: stock.image!.url!,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    )
                    : ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: AppColors.lightSkeletonColor,
                        ),
                        child: Icon(
                          Icons.broken_image_outlined,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        stock.name ?? "Unknown Stock",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        stock.symbol ?? "N/A",
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Exchange: ${stock.exchange ?? "N/A"}",
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                      Text(
                        "Industry: ${stock.industry ?? "N/A"}",
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                      Text(
                        "Market Cap: ${stock.marketCap ?? "N/A"}",
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

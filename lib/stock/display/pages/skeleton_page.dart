import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart'
    show useEffect, useState, useTextEditingController;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stocks/auth/display/providers/auth_provider.dart';
import 'package:stocks/core/config/routes/app_router.dart';
import 'package:stocks/core/config/routes/routes.dart';
import 'package:stocks/core/helpers/constants/app_colors.dart';
import 'package:stocks/core/helpers/constants/app_typography.dart';
import 'package:stocks/core/helpers/extensions/context_extensions.dart';
import 'package:stocks/core/shared/widgets/async_value_widget.dart';
import 'package:stocks/core/shared/widgets/custom_textfield.dart';
import 'package:stocks/core/shared/widgets/empty_state_widget.dart';
import 'package:stocks/core/shared/widgets/error_response_handler.dart';
import 'package:stocks/stock/display/providers/stock_providers.dart';
import 'package:stocks/stock/display/widgets/stock_card.dart';

class SkeletonPage extends StatefulHookConsumerWidget {
  const SkeletonPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SkeletonPageState();
}

class _SkeletonPageState extends ConsumerState<SkeletonPage> {
  @override
  Widget build(BuildContext context) {
    var searchController = useTextEditingController();
    var searchQuery = useState<String>("");

    useEffect(() {
      searchController.addListener(() {
        if (searchController.text.length > 3) {
          searchQuery.value = searchController.text;
        }
      });
      return null;
    }, [searchController]);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 100,
            pinned: true,
            floating: false,
            automaticallyImplyLeading: false,
            snap: false,
            title: Center(
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Search Stock here...",
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://media2.dev.to/dynamic/image/width=1000,height=420,fit=cover,gravity=auto,format=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2Fqewz0cig2k7bw734qy4v.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  ref.read(authProvider.notifier).logout();
                },
                icon: Icon(Icons.logout),
              ),
            ],
          ),
          searchController.text.isEmpty
              ? SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.auto_graph_sharp,
                        color: AppColors.primaryColor,
                        size: 90,
                      ),
                      Text(
                        "Search Stock",
                        style: AppTypography.primary.heading22,
                      ),
                    ],
                  ),
                ),
              )
              : AsyncValueWidget(
                value: ref.watch(stocksFutureProvider(searchController.text)),
                loading:
                    () => SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                error:
                    (e, st) => SliverFillRemaining(
                      hasScrollBody: false,
                      child: ErrorResponseHandler(
                        retryCallback: () {},
                        error: e,
                        stackTrace: st,
                      ),
                    ),
                data: (data) {
                  if (data == null || data.isLeft()) {
                    return SliverFillRemaining(
                      hasScrollBody: false,
                      child: ErrorResponseHandler(
                        retryCallback: () {},
                        error: data!.fold(
                          (error) => error,
                          (_) => SizedBox.shrink(),
                        ),
                        stackTrace: null,
                      ),
                    );
                  }

                  final stocks = data.fold((_) => null, (r) => r);
                  if (stocks == null || stocks.isEmpty) {
                    return SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: EmptyStateWidget(
                          height: context.screenHeight * 0.4,
                          width: context.screenWidth * 0.6,
                        ),
                      ),
                    );
                  }

                  return SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return StockCard(stock: stocks[index]);
                    }, childCount: stocks.length),
                  );
                },
              ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: context.screenWidth * 0.5,
        height: 90,
        child: CustomTextField(
          border: BorderSide(color: AppColors.primaryColor),
          suffix: Icon(Icons.search),
          prefix: Icon(Icons.auto_graph_sharp),
          hintText: "Stock ID",
          onChanged: (value) {
            if (value!.length > 3) {
              AppRouter.pushNamed(Routes.stockById, args: {"id": value});
            }
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart'
    show useEffect, useState, useTextEditingController;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stocks/core/helpers/constants/app_colors.dart';
import 'package:stocks/core/helpers/constants/app_typography.dart';
import 'package:stocks/core/shared/widgets/async_value_widget.dart';
import 'package:stocks/core/shared/widgets/error_response_handler.dart';
import 'package:stocks/stock/display/providers/stock_providers.dart';
import 'package:stocks/stock/display/widgets/stock_card.dart';

class StockById extends StatefulHookConsumerWidget {
  final String? searched;
  const StockById({super.key, this.searched});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StockByIdState();
}

class _StockByIdState extends ConsumerState<StockById> {
  @override
  Widget build(BuildContext context) {
    var searchController = useTextEditingController(text: widget.searched);
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
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context),
            ),
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
                value: ref.watch(
                  stockDetailsFutureProvider(searchController.text),
                ),
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
                  return data!.fold(
                    (error) {
                      return SliverToBoxAdapter(
                        child: ErrorResponseHandler(
                          retryCallback: () {},
                          error: error,
                          stackTrace: null,
                        ),
                      );
                    },
                    (stock) {
                      if (stock != null) {
                        return SliverToBoxAdapter(
                          child: StockCard(stock: stock),
                        );
                      } else {
                        return SliverToBoxAdapter(child: SizedBox.shrink());
                      }
                    },
                  );
                },
              ),
        ],
      ),
    );
  }
}

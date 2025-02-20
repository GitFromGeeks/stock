import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SkeletonPage extends ConsumerStatefulWidget {
  const SkeletonPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SkeletonPageState();
}

class _SkeletonPageState extends ConsumerState<SkeletonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: Text("Stock App"));
  }
}

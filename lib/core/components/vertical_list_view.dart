import 'package:flutter/material.dart';
import 'package:ny_news/core/resources/app_values.dart';

class VerticalListView extends StatefulWidget {
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final Function addEvent;

  const VerticalListView(
      {super.key,
      req,
      required this.itemCount,
      required this.itemBuilder,
      required this.addEvent});

  @override
  State<VerticalListView> createState() => _VerticalListViewState();
}

class _VerticalListViewState extends State<VerticalListView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    //_scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    // _scrollController
    //   ..removeListener(_onScroll)
    //   ..dispose();
    super.dispose();
  }

  // void _onScroll() {
  //   if (_scrollController.position.atEdge) {
  //     if (_scrollController.position.pixels != 0) {
  //       widget.addEvent();
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(AppPadding.p8),
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      itemBuilder: widget.itemBuilder,
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: AppSize.s10,
        );
      },
      itemCount: widget.itemCount,
    );
  }
}

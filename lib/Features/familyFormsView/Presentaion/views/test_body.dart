import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class TestBody extends StatefulWidget {
  const TestBody({super.key});

  @override
  State<TestBody> createState() => _TestBodyState();
}

class _TestBodyState extends State<TestBody> {
  late final _pagingController = PagingController<int, String>(
    getNextPageKey: (state) => (state.keys?.last ?? 0) + 1,
    fetchPage: (pageKey) => ["$pageKey"],
  );
  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PagingListener(
      controller: _pagingController,
      builder: (context, state, fetchNextPage) => PagedListView<int, String>(
        state: state,
        fetchNextPage: fetchNextPage,
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (context, item, index) => ListTile(
            title: Text(item),
          ),
        ),
      ),
    );
  }
}

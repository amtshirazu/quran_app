import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_app/features/bookmark/presentation/widgets/bookmark_body.dart';
import 'package:quran_app/features/bookmark/presentation/widgets/bookmark_header.dart';

class BookmarkScreen extends ConsumerStatefulWidget {
  const BookmarkScreen({super.key});

  @override
  ConsumerState<BookmarkScreen> createState() => BookmarkScreenState();
}

class BookmarkScreenState extends ConsumerState<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            const BookmarkHeader(),
            const Expanded(child: BookmarkBody()),
          ],
        ),
      ),
    );
  }
}

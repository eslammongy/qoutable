import 'package:flutter/material.dart';
import 'package:quotable/core/utils/helper.dart';
import 'package:quotable/config/theme/app_theme.dart';
import 'package:quotable/config/theme/text_style.dart';
import 'package:quotable/core/widgets/home_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotable/core/widgets/single_view_appbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';
import 'package:quotable/features/quotes/presentation/views/widgets/accent_color_toggles.dart';

class SingleQuoteScreen extends StatelessWidget {
  const SingleQuoteScreen({super.key, required this.quote});
  final QuoteEntity quote;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Scaffold(
      appBar: singleViewAppBar(context, title: quote.author ?? ''),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            buildDecoratedQuoteCard(),
            const SizedBox(
              height: 20,
            ),
            const AccentColorToggles()
          ],
        ),
      ),
    );
  }

  DecoratedBox buildDecoratedQuoteCard() {
    return DecoratedBox(
      decoration: customizedDecorationBox([
        const Color(0xFF5F20F1),
        const Color(0xFFAE0606),
      ]),
      child: SizedBox(
        height: 220.h,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Icon(FontAwesomeIcons.quoteLeft),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      quote.content ?? '',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      textAlign: TextAlign.center,
                      style: TextStyles.font18Bold,
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.bottomRight,
                child: Icon(FontAwesomeIcons.quoteRight),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

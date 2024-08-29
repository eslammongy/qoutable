import 'package:flutter/material.dart';
import 'package:quotable/core/utils/helper.dart';
import 'package:quotable/config/theme/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';

final GlobalKey<QuoteDecoratedBoxState> quoteDecoratedBoxKey =
    GlobalKey<QuoteDecoratedBoxState>();

class QuoteDecoratedBox extends StatefulWidget {
  const QuoteDecoratedBox({
    super.key,
    required this.quote,
  });

  final QuoteEntity quote;

  @override
  State<QuoteDecoratedBox> createState() => QuoteDecoratedBoxState();
}

class QuoteDecoratedBoxState extends State<QuoteDecoratedBox> {
  List<Color> gradientBox = [const Color(0xFF5F20F1), const Color(0xFFAE0606)];
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: customizedDecorationBox(gradientBox),
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
                      widget.quote.content ?? '',
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

  changeQuoteBoxTheme(List<Color> colors) {
    setState(() {
      gradientBox = colors;
    });
  }
}

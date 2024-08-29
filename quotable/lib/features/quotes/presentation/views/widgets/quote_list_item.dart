import 'package:flutter/material.dart';
import 'package:quotable/config/theme/app_theme.dart';
import 'package:quotable/config/theme/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';

class QuoteListItem extends StatelessWidget {
  const QuoteListItem({
    super.key,
    required this.quote,
  });
  final QuoteEntity quote;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Card(
        color: theme.appColors.surface,
        child: SizedBox(
          height: 200.h,
          width: 100.w,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      color: context.theme.appColors.primary.withOpacity(0.6),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          quote.author ?? '',
                          textAlign: TextAlign.center,
                          style: TextStyles.font13SemiBold
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(FontAwesomeIcons.quoteRight),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

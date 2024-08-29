import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotable/core/utils/helper.dart';
import 'package:quotable/config/theme/app_theme.dart';
import 'package:quotable/config/theme/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';
import 'package:quotable/features/quotes/presentation/bloc/decorate/decorate_quote_bloc.dart';
import 'package:quotable/features/quotes/presentation/bloc/decorate/decorate_quote_state.dart';

class QuoteDecoratedBox extends StatelessWidget {
  const QuoteDecoratedBox({
    super.key,
    required this.quote,
  });

  final QuoteEntity quote;

  @override
  Widget build(BuildContext context) {
    final decoratedBloc = BlocProvider.of<DecorateQuoteBloc>(context);
    return BlocBuilder<DecorateQuoteBloc, DecorateQuoteState>(
      builder: (context, state) {
        return DecoratedBox(
          decoration: customizedDecorationBox(
            decoratedBloc.selectedThemeColors,
            radius: 14,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: 220.h, maxHeight: 300.h),
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
                          style: decoratedBloc.quoteTextStyle
                              .copyWith(fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        color:
                            context.theme.appColors.background.withOpacity(0.8),
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
          ),
        );
      },
    );
  }
}

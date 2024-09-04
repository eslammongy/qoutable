import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:quotable/core/utils/helper.dart';
import 'package:quotable/core/constant/constant.dart';
import 'package:quotable/config/theme/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotable/features/authors/domain/entities/author.dart';
import 'package:quotable/features/quotes/presentation/views/widgets/quote_action_btn.dart';

class AuthorInfoBottomSheet extends StatelessWidget {
  const AuthorInfoBottomSheet({super.key, required this.author});
  final AuthorEntity author;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.h,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.info_rounded,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  authorInfo,
                  style: TextStyles.font16SemiBold,
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              author.name ?? '',
              textAlign: TextAlign.center,
              style: TextStyles.font20Bold,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              author.description ?? '',
              textAlign: TextAlign.center,
              style: TextStyles.font16SemiBold,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              author.bio ?? '',
              textAlign: TextAlign.center,
              style: TextStyles.font14Regular,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomQuoteBtn(
              text: moreInfo,
              hasBorder: false,
              onTap: () async {
                if (author.link == null) return;
                final Uri url = Uri.parse(author.link!);
                final bool canLaunchUrl = await launchUrl(url);
                if (!canLaunchUrl && context.mounted) {
                  displaySnackBar(context, "Could not launch $url");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

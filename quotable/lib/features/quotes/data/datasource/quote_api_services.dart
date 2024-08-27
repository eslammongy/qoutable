import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:quotable/core/constant/strings.dart';
import 'package:quotable/features/quotes/data/models/quote.dart';

part 'quote_api_services.g.dart';

@RestApi(baseUrl: quoteBaseUrl)
abstract class QuoteApiServices {
  factory QuoteApiServices(Dio dio) = _QuoteApiServices;

  @GET('/quotes')
  Future<HttpResponse<List<QuoteModel>>> fetchRemoteQuotes(
      {@Query("limit") int limit = 30});
}

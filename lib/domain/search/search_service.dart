import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/search/models/search_resp/search_resp.dart';

abstract class SearchService {
  Future<Either<MainFailures, SearchResp>> searchMovies({
    required String movieQuery,
  });
}

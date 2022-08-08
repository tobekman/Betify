import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../../../../register_services.dart';
import '../../../core/common/app_exception.dart';
import '../../../core/common/data_state.dart';
import '../../../core/common/error_response.dart';
import '../../../core/common/params/get_bets_params.dart';
import '../../../domain/models/bets/oneXTwo.dart';
import '../../../domain/models/config/app_config.dart';
import '../../../domain/models/users/storage/logged_in_user.dart';
import '../../../domain/repositories/bets/one_x_two_repository.dart';

class OneXTwoService implements OneXTwoRepository {
  @override
  Future<DataState<List<OneXTwo>>> getUserOneXTwos(GetBetsParams params) async {
    final url = Uri.parse('${getIt<AppConfig>().baseApiUrl}/api/onextwo');
    final LoggedInUser user = Hive.box('userBox').get(0);

    try {
      var response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${user.token}',
        },
      );

      final body = _returnResponse(response);
      List<OneXTwo> bets = [];
      for (dynamic bet in body) {
        bets.add(OneXTwo.fromMap(bet));
      }

      return DataSuccess(bets);
    } on Exception catch (e) {
      return DataFailed(e);
    }
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(
          ErrorResponse(
              status: 400, title: response.body, traceId: '', type: ''),
        );
      case 401:
        {
          throw UnauthorisedException(ErrorResponse(
              status: 401, title: 'Unauthorized', traceId: '', type: ''));
        }
    }
  }
}

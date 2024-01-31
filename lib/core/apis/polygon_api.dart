import 'package:locate_mate/core/apis/api_base.dart';
import 'package:locate_mate/core/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'polygon_api.g.dart';

@riverpod
Future<PolygonModel> getPolygons(
  GetPolygonsRef ref, {
  Map<String, dynamic>? params,
}) async {
  var res = await ApiBase.getRequest(
    path: 'https://maps.googleapis.com/maps/api/directions/json',
    params: params,
  );

  return PolygonModel.fromJson(res.data);
}

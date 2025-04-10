import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart';

// ignore_for_file: annotate_overrides
//모델클래스 Store에 내가 필요한 정보만 입력
@freezed
class Store with _$Store {
  final String address;
  final String openDay;
  final double lat;
  final double lng;
  final String storeName;
  final String remainState;
  final String stockAt;

  const Store({
    required this.address,
    required this.openDay,
    required this.lat,
    required this.lng,
    required this.storeName,
    required this.remainState,
    required this.stockAt,
  });
}

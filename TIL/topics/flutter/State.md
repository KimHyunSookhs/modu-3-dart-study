```
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_finder/data/model/image.dart';

part 'search_screen_state.freezed.dart';

@freezed
abstract class SearchScreenState with _$SearchScreenState {
  const factory SearchScreenState({
    @Default(<Image>[]) List<Image> images,
    @Default(false) bool isLoading,
  }) = _SearchScreenState;
}
```

1. 추상클래스로 선언
2. @Default를 사용해 default값 주기
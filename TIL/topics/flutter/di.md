의존성 주입은 객체가 자신의 의존성을 직접 생성하지 않고 외부에서 제공받는 소프트웨어 디자인 패턴 중 하나이다.

의존성 주입의 장점으로는

1. 테스트 용이성 : 모의객체(mock)를 주입해 단위 테스트 가능
2. 유연성 : 동일한 인터페이스를 구현한 다양한 구현체로 쉽게 교체 가능
3. 결합도 감소 : 컴포넌트 간 직접적인 의존성 제거
4. 관심사 분리 : 객체 생성과 사용의 책임 분리

의존성 등록 방식

- Singletone
  앱 시작시 1번만 생성
  예 : Repository, DataSource, UseCase
  상태가 없는 기능 클래스이기 때문에 계속 재사용하면 효율적임

- Factory
  필요할 때마다 새로 생성
  예 : ViewModel
  ViewModel의 경우 화면상태를 관리하기 때문에 각 화면마다 독립된 상태가 필요함

⭐ GetIt을 사용한 의존성 주입 ⭐
먼저 flutter pub add get_it 으로 패키지 다운받기
보통 DI 관련 파일은 core에다 생성하기 때문에 core/di 파일생성후
di_setup.dart 파일 생성

예시 코드
final getIt = GetIt.instance;

```dart
void diSetUP() {
//DataSource
  getIt.registerSingleton<ImageDataSource>(ImageDataSourceImpl());
//Repository
  getIt.registerSingleton<ImageRepository>(
    ImageRepositoryImpl(imageDataSource: getIt()),
  );
//UseCase
  getIt.registerSingleton(SearchImagesUseCase(imageRepository: getIt()));
//ViewModel
  getIt.registerFactory<SearchScreenViewModel>(
        () =>
        SearchScreenViewModel(
          searchImagesUseCase: getIt(),
        ),
  );
}
```

이렇게 해주고 꼭 main에서

```dart
void main() async {
  diSetUP();
  runApp(const MyApp());
}
```

diSetUP() 선언해주기~~~

이렇게 하면 Test코드나 Route로 화면 이동 설정할때
보통 ViewModel을 불러오니까

```dart
GoRoute
(
path: Routes.searchScreen,
builder: (context, state) {
final viewModel = SearchScreenViewModel( searchImagesUseCase: getIt());
return SearchScreen(screenViewModel: viewModel);
},
)
```

이런식으로getIt()으로 불러와주면 저 안에 여러 파일 안불러와도 되서 매우 간편
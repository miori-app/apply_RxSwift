## 🛠 개발 목표 (공부 목표)
- github organization의 repo를 가져오는 api를 통해 RxSwift를 활용해 URLSession 과 그냥 URLSession 비교해보기

## 🛠 사용한 API
- [깃허브 api docs](https://docs.github.com/en/rest/reference/repos)

## 🛠 Dependency Management
- CocoaPods
   - 대부분의 라이브러리를 cocoapods 를 통해 관리/설치 할수 있다
   - 다만, 빌드속도가 느려저, SPM을 써보았다
- SPM (Swift Package Manager)

## 🛠 기술스택
- 'RxSwift', '6.2.0'
- 'RxCocoa', '6.2.0'
- 'SnapKit', '5.0.1'

## 🤔 회고
- 내가 뿌릴 json 데이터들이 array에 싸여있지 않아, dictionary 형태로 변경후, 내가 원하는 entity 로 다시 변환을 시켜야했다.
- 이과정에서 JSONSerialization을 활용해 rx는 operator를 통해 쉽게 변환할수 있었지만, rx를 사용하지 않았을때는 이 과정이 복잡하고, 코드가 길어졌다.

## ☄ 이슈와 해결


# Twitter-iOS
🐥합동세미나 9조 짹짹 아요🐥


</br>

### 👩🏻‍💻 Developers

민재 수연 유진 -> 나중에 미모티콘 추가하기

</br>

### 👀 Simulator

구현화면 공간

</br>

### 🛠 Development Environment

<img width="77" alt="스크린샷 2021-11-19 오후 3 52 02" src="https://img.shields.io/badge/iOS-15.0+-silver"> <img width="88" alt="스크린샷 2021-11-19 오후 3 52 02" src="https://img.shields.io/badge/Xcode-13.3-blue">

</br>


### 🎁 Library

| 라이브러리        | Version |       |
| ----------------- | :-----: | ----- |
| Alamofire           | `5.6.1` | `SPM` |
| SnapKit           | `5.6.0` | `SPM` |



</br>

### 🗂 Foldering

<img width="263" alt="image" src="https://user-images.githubusercontent.com/81313960/168471339-9bdf7902-3568-4e3b-90d0-8a1097599d11.png">


</br>

### 🔀 Git Branch

Branch를 생성하기 전 Issue를 먼저 작성한다.
Issue 작성 후 생성되는 번호와 Issue의 간략한 설명 등을 조합하여 Branch의 이름을 결정한다. 

`<Prefix>/<Issue_Number>-<Description>` 의 양식을 따른다.

- `develop` : feature 브랜치에서 구현된 기능들이 merge될 브랜치. default
- `feature` : 기능을 개발하는 브랜치, 이슈별/작업별로 브랜치를 생성하여 기능을 개발한다
- `main` : 개발이 완료된 산출물이 저장될 공간
- `release` : 릴리즈를 준비하는 브랜치, 릴리즈 직전 QA 기간에 사용한다
- `bug` : 버그를 수정하는 브랜치
- `hotfix` : 정말 급하게, 데모데이 직전에 에러가 난 경우 사용하는 브렌치


</br>

### 👊🏻 Git Flow

1. Issue를 생성한다.
2. feature Branch를 생성한다.
3. Add - Commit - Push - Pull Request 의 과정을 거친다.
4. Pull Request가 작성되면 작성자 이외의 다른 팀원이 Code Review를 한다.
5. Code Review가 완료되면 Pull Request 작성자가 develop Branch로 merge 한다.
6. 종료된 Issue와 Pull Request의 Label과 Project를 관리한다.


</br>

### ⚠️ Issue Naming Rule

`[<PREFIX>] <Description>` 의 양식을 준수하되, Prefix는 협업하며 맞춰가기로 한다.
또한 Prefix는 대문자를 사용한다.

```
[FEAT] 회원가입 구현
[DEBUG] MainActivity 버그 수정
[STYLE] 폰트 변경
```

</br>

### 🍗 Commit Message Convention

- `[Fix]` : 버그, 오류 해결
- `[Chore]`: 코드 수정, 내부 파일 수정
- `[Correct]` : 주로 문법의 오류나 타입의 변경, 이름 변경 등에 사용합니다.
- `[Add]` : Feat 이외의 부수적인 코드 추가, 라이브러리 추가, 새로운 View 생성
- `[Feat]` : 새로운 기능 구현
- `[Del]` : 쓸모없는 코드 삭제
- `[Docs]` : README나 WIKI 등의 문서 개정
- `[Mod]` : storyboard 파일만 수정한 경우
- `[Move]` : 프로젝트 내 파일이나 코드의 이동
- `[Rename]` : 파일 이름 변경이 있을 때 사용합니다.
- `[Improve]` : 향상이 있을 때 사용합니다.
- `[Refactor]` : 전면 수정이 있을 때 사용합니다


```
[#이슈번호] 해당 커밋 요약

### Description
- 커밋 상세내용 1
- 커밋 상세내용 2

Resolve #이슈번호
```


</br>

### 🌀 Code Covention

[StyleShare/swift-style-guide](https://github.com/StyleShare/swift-style-guide) 를 기본으로 따르고 필요에 따라 추가한다.


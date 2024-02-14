# Guin Team iOS

### IA Board Link(Information Architecture) 
<a href="https://www.notion.so/IA-Information-Architecture-9024980b82b6493fb77cf87b968934da?pvs=4"> 
<img width="64" src="https://github.com/9in-team/GuinTeam-iOS/assets/60867281/0765cb5a-eb25-49ea-9bc2-dba3f39b5358" alt="구인팀 노션 보드">
</a>

<br>

## Project Informations
#### Architecture
 - MVVM
#### Main Stack
 - UIKit (Codebase)
#### Libraries
 - SnapKit
 - RxSwift
 - Alamofire
 - SDWebImage
 - Then
 
 
## MVVM Rule
 - InputOutput Pattern 사용 시 InputOutputProtocol을 채택한다.
 - ViewController의 기능은 최소화 한다.


## Commit Rule
* 커밋 내용에 맞는 머리말을 사용한다
  * feat: 기능 추가
  * fix: 기능에 문제가 있어 수정
  * refactor: 코드 리팩터링 (동작 변경 전혀X)
  * docs: 문서 수정
  * chore: 빌드 업무 수정, 패키지 매니저 수정, gitignore, 프로젝트 초기설정 등
* 커밋 메시지 제목으로 커밋 내용을 알기 어렵다면 본문으로 추가 설명한다.


## Installation
```bash
$ git clone https://github.com/9in-team/GuinTeam-iOS.git
$ cd GuinTeam-iOS/GuinTeam-iOS
$ open GuinTeam-iOS.xcodeproj
```


iOS Simulators 사용해서 빌드
* 라이브러리 오류 시
  * File —> Packages -> Reset Package Caches
  * File —> Packages -> Update to Latest Package Versions

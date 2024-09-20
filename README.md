<div style="display: flex; flex-direction:row;">
    <h2>👨‍🏫 프로젝트 소개
        <div style="width:12px"></div>
        <img src="https://img.shields.io/badge/spring-6DB33F?style=flat&logo=spring&logoColor=white">
        <img src="https://img.shields.io/badge/jquery-0769AD?style=flat&logo=jquery&logoColor=white" alt="jQuery">
        <img src="https://img.shields.io/badge/javascript-F7DF1E?style=flat&logo=javascript&logoColor=black"
            alt="JavaScript">
        <img src="https://img.shields.io/badge/css-1572B6?style=flat&logo=css3&logoColor=white" alt="CSS">
        <img src="https://img.shields.io/badge/mysql-4479A1?style=flat&logo=mysql&logoColor=white">
        <img src="https://img.shields.io/badge/github-181717?style=flat&logo=github&logoColor=white">
    </h2>

</div>

사용자에게 편리한 UI/UX를 제공하는것에 초점을 둔 프로젝트 <br>
특히 [ 날짜 , TODO_주제 ]을 편집이 손쉽게 이루어질 수 있도록 집중

<br>

## ⏲️ 개발 기간
- 2024.07.01(월) ~ 2023.07.25(목)
- 요구사항 분석
- 역할 배정
- [시퀀스,ERD]_작성
- 피그마로 1차 화면 설계
- 필요한 컨포넌트_자료수집
- 컨포넌트_구현
- 백엔드_데이터_수집
- 데이터_연결
- 테스트, 코드_수정
- 최종_문서_작업

<br>

## 🧑‍🤝‍🧑 개발자
- **임재혁** : 팀장, UX,UI_디자인
- **권승훈** : 데이터_분석, DB연결, server연결
- **조유빈** : 데이터_분석, 프론트엔드, DB구조_설계

<br>

## 💻 개발환경
- **Version** : 17.0.10
- **IDE** : intelliJ 2023.3.4
- **Framework** : Spring 5.2.3
- **ORM** : Mybatis

<br>

## ⚙️ 기술 스택
- **DataBase** : MySQL

<br>

## 📌 주요 기능
### TODO 관리
- **TODO 작성**
- TODO 생성 UI를 클릭하여 즉시 TODO를 생성할 수 있음.
- 값이 null이거나 취소 시 blur가 발생하면 TODO가 생성되지 않음.

- **TODO 편집**
- 피드 페이지 내에서 편집되는 TODO는 모두 AJAX로 처리되어 화면 이동이 필요 없음.
- 수정하고 싶은 TODO를 더블클릭하면 해당 자리에서 수정 가능.
- TODO의 "more" 버튼에서 수정 버튼으로 편집할 수 있음.
- 수정된 값이 null인 경우, 해당 수정을 취소하고 원래 값으로 복원됨.

- **TODO 주제 변경**
- 주제를 변경하고자 하는 TODO를 드래그하여 원하는 주제로 변경 가능.

- **TODO 날짜 수정**
- TODO의 "more" 버튼에서 날짜를 [오늘→내일, 과거→오늘, 미래→오늘]로 변경할 수 있는 조건에 따른 선택지 제공.
- 다른 날짜로 이동 가능.

- **TODO 복제**
- 해당 TODO를 다른 날짜에도 복제할 수 있음.

- **TODO 삭제**
- TODO의 "more" 버튼에서 삭제 버튼으로 삭제 가능.

### 시각화 및 편의 기능
- **캘린더 및 도넛 차트**
- 해당 월에 TODO의 완료 진행률과 카운트를 제공.

- **날짜 수정 캘린더**
- TODO 수정 캘린더에 오늘 날짜를 마킹하여 편의성을 제공.
- 미래 달력의 경우 (1일), 과거 달력의 경우 (28일, 30일, 31일)을 마킹함.

### 공개 및 공유 기능
- **TODO 공개 범위 설정**
- 주제별로 TODO를 [전체 공개, 팔로우 공개, 비공개]로 설정할 수 있는 선택지 제공.

- **일기 작성**
- 날짜별 기분에 따른 이모지와 배경을 설정하고 공개 여부에 대한 선택지 [전체 공개, 팔로우 공개, 비공개]를 제공.

- **팔로워 및 팔로잉**
- 다른 사용자 간의 팔로우 기능 제공.
- 타인 라인 화면에서 다른 사람들이 완료한 TODO를 확인할 수 있음.

<br>

## ✒️ Figma
- Figma : [ TODE_프로토타입 보기
](https://www.figma.com/proto/tMgkRWVhFeoeY46mDktsQ2/%EB%A0%88%ED%8D%BC%EB%9F%B0%EC%8A%A4?node-id=215-1225/)

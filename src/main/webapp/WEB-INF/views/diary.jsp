<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


    <meta name="viewport" content="initial-scale=1, width=device-width">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto Sans KR:wght@300;500&display=swap"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Pretendard:wght@500;600;700&display=swap"/>
    <link href="${path}/resources/diary/style.css" type="text/css" rel="stylesheet"/>
    <link href="${path}/resources/app.css" type="text/css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${path}/resources/diary/script.js"></script>

</head>
<body>
<div class="diary-container">

    <div class="diary-body">
        <div class="diary-top">
            <div class="diary-header">
                <!--일기 해더 왼쪽 화살표-->
                <div class="black-left-arrow icon-32"></div>

                <div class="emphasis">일기</div>
                <div class="emphasis diary-complete">완료</div>
            </div>
            <div class="blue-diary-position">
                <div class="select-emogi-button">
                    <!--윙크 이모지 아이콘-->
                    <div class="color-diary icon-54"></div>
                </div>
            </div>
            <div class="pro-box">
                <div class="profile-items">
                    <div class="profile-image icon-32"></div>
                    <div class="profile-text">
                        <div class="username">UserName</div>
                        <div class="profile-text-bottom">
                            <!-- -->
                            <div class="select-calendar-button">
                                <div class="date-follower">2024년 7월 1일 월요일</div>
                            </div>
                            <div class="profile-icon-position">
                                <!-- 일기 사람모양 아이콘-->
                                <div class="select-open-setting-button">
                                    <div class="follower-open">
                                        <div class="black-group icon-10"></div>
                                        <div class="date-follower">팔로워 공개</div>
                                        <!--역삼각형 모양 아이콘-->
                                        <div class="white-hard-drop-down icon-10"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <textarea id="diary-textarea" placeholder="입력을 하시오.">${diaryvo[0].diaryContent.trim()}</textarea>
            </div>

            <div class="diary-lower-bottom">
                <!--일기 좌하단 무지개 아이콘-->
                <div class="select-color-button">
                    <div class="rainbow icon-24" onclick=""></div>
                </div>
                <!---->
                <div class="color-image-frame icon-24"></div>

            </div>
        </div>
    </div>


        <!-- -----------------------모달창---------------------------------- -->
    <div class="diary-black-modal">
    </div>
        <div class="open-setting-modal">
            <div class="open-setting-title">
                <div class="gray-slice-bar">
                </div>
                <div class="open-setting-text">공개설정</div>
            </div>
            <div class="open-setting-items">
                <div class="gobal-open">
                    <div class="gobal-open-width">
                        <div class="gobal-open-height-gap">
                            <div class="black-earth icon-18 op-5"></div>
                        </div>
                        <div>전체 공개</div>
                    </div>
                    <div class="blue-radio icon-20"></div>
                </div>
                <div class="follower-open">
                    <div class="gobal-open-width">
                        <div class="gobal-open-height-gap">
                            <div class="black-group icon-18 op-5"></div>
                        </div>
                        <div>팔로워 공개</div>
                    </div>
                    <div class="blue-radio icon-20"></div>
                </div>
                <div class="gobal-open">
                    <div class="gobal-open-width">
                        <div class="open-onlyme-image-width">
                            <div class="open-onlyme-iamge-position">
                                <div class="black-lock icon-18 op-5"></div>
                            </div>
                        </div>
                        <div>나만보기</div>
                    </div>
                    <div class="blue-radio icon-20"></div>
                </div>
            </div>
            <div class="open-setting-ok-button">
                <div class="ok-button">확인</div>
            </div>
        </div>
        <div class="calendar-modal">
            <div class="calendar-title">
                <div class="gray-slice-bar">
                </div>
                <div class="all-todo-copy">모든 할 일 복사</div>
            </div>
            <div class="calendar-select-bar">
                <div class="selected-date">2024년 6월</div>
                <div class="select-buttons">
                    <div class="black-left-arrow icon-14"></div>
                    <div class="black-right-arrow icon-14"></div>
                </div>
            </div>
            <div class="calendar-contents">
                <div class="week-days-position">
                    <div class="calendar-Day-weekend">일</div>
                    <div class="calendar-Day-weekday">월</div>
                    <div class="calendar-Day-weekday">화</div>
                    <div class="calendar-Day-weekday">수</div>
                    <div class="calendar-Day-weekday">목</div>
                    <div class="calendar-Day-weekday">금</div>
                    <div class="calendar-Day-weekday">토</div>
                </div>
                <div class="calendar-days">
                    <div class="empty"></div>
                    <div class="empty"></div>
                    <div class="empty"></div>
                    <div class="empty"></div>
                    <div class="empty"></div>
                    <div class="empty"></div>
                    <div class="div18">
                        <div class="div19">1</div>
                    </div>
                    <div class="calendar-sunday">2</div>
                    <div class="calendar-weekday-date">3</div>
                    <div class="calendar-weekday-date">4</div>
                    <div class="calendar-weekday-date">5</div>
                    <div class="calendar-weekday-date">6</div>
                    <div class="calendar-weekday-date">7</div>
                    <div class="div26">
                        <div class="div27">8</div>
                    </div>
                    <div class="calendar-sunday">9</div>
                    <div class="calendar-weekday-date">10</div>
                    <div class="calendar-weekday-date">11</div>
                    <div class="calendar-weekday-date">12</div>
                    <div class="calendar-weekday-date">13</div>
                    <div class="calendar-weekday-date">14</div>
                    <div class="calendar-weekday-date">15</div>
                    <div class="calendar-sunday">16</div>
                    <div class="calendar-weekday-date">17</div>
                    <div class="calendar-weekday-date">18</div>
                    <div class="calendar-weekday-date">19</div>
                    <div class="calendar-weekday-date">20</div>
                    <div class="calendar-weekday-date">21</div>
                    <div class="calendar-weekday-date">22</div>
                    <div class="calendar-sunday">23</div>
                    <div class="calendar-weekday-date">24</div>
                    <div class="calendar-weekday-date">25</div>
                    <div class="calendar-weekday-date">26</div>
                    <div class="calendar-weekday-date">27</div>
                    <div class="calendar-weekday-date">28</div>
                    <div class="calendar-weekday-date">29</div>
                    <div class="calendar-sunday">30</div>
                </div>
            </div>
            <div class="calendar-ok-button">
                <div class="ok-text">확인</div>
            </div>
        </div>
        <div class="colors-modal">
            <div class="calendar-title">
                <div class="gray-slice-bar">
                </div>
                <div class="all-todo-copy">배경 색상</div>
            </div>
            <div class="colors-items">
                <div class="gray-no-select icon-24"></div>
                <div class="color-item pointer">
                </div>
                <div class="color-item pointer">
                </div>
                <div class="color-item">
                </div>
                <div class="color-item">
                </div>
                <div class="color-item">
                </div>
                <div class="color-item">
                </div>
                <div class="color-item">
                </div>
                <div class="color-item">
                </div>
                <div class="color-item">
                </div>
                <div class="color-item">
                </div>
                <div class="color-item">
                </div>
                <div class="color-item">
                </div>
                <div class="color-item">
                </div>
                <div class="color-item">
                </div>
                <div class="color-item">
                </div>
                <div class="color-item">
                </div>
                <div class="color-item">
                </div>

            </div>
        </div>
        <div class="emoji-modal">
            <div class="emoji-title">
                <div class="gray-slice-bar">
                </div>
                <div class="all-todo-copy">이모지</div>
            </div>
            <div class="emoji-items">
                <div class="emoji-item">
                </div>
                <div class="emoji-item">
                </div>
                <div class="emoji-item">
                </div>
                <div class="emoji-item">
                </div>
                <div class="emoji-item">
                </div>
                <div class="emoji-item">
                </div>
                <div class="emoji-item">
                </div>
                <div class="emoji-item">
                </div>
                <div class="emoji-item">
                </div>
                <div class="emoji-item">
                </div>
                <div class="emoji-item">
                </div>
                <div class="emoji-item">
                </div>
                <div class="emoji-item">
                </div>
                <div class="emoji-item">
                </div>
                <div class="emoji-item">
                </div>
                <div class="emoji-item">
                </div>
                <div class="emoji-item">
                </div>
                <div class="emoji-item">
                </div>
                <div class="emoji-item">
                </div>
                <div class="emoji-item">
                </div>
                <div class="emoji-item">
                </div>
                <div class="emoji-item">
                </div>
                <div class="emoji-item">
                </div>
                <div class="emoji-item">
                </div>
                <div class="emoji-item">
                </div>
                <div class="emoji-item">
                </div>
                <div class="emoji-item">
                </div>
                <div class="emoji-item">
                </div>
                <div class="emoji-item">
                </div>
                <div class="emoji-item">
                </div>
            </div>
        </div>
    </div>


</body>


<script>
    document.addEventListener('DOMContentLoaded', (event) => {
        const textarea = document.getElementById('diary-textarea');

        textarea.addEventListener('input', autoResize);

        function autoResize() {
            this.style.height = 'auto'; // 높이 초기화
            this.style.minHeight = '500px'; // 최소 높이 설정
            this.style.maxHeight = '700px'; // 최대 높이 설정
            this.style.height = this.scrollHeight + 'px'; // 내용에 따라 높이 조절
        }
    });

</script>

</body>
</html>
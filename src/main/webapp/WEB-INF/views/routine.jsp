<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jstl/core_rt" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, width=device-width">
    <!-- jQuery 라이브러리 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- jQuery UI 라이브러리 -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <!-- jQuery UI CSS -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="${path}/resources/routine/script.js"></script>
    <link href="${path}/resources/routine/style.css" type="text/css" rel="stylesheet"/>
    <link href="${path}/resources/app.css" type="text/css" rel="stylesheet"/>
</head>

<body>

<div class="routine-page">
    <div class="routine-container">
        <div class="routine-header">
            <div class="black-left-arrow icon-28"></div>
            <div class="emphasis">루틴</div>
            <div class="emphasis routine-header-finish">완료</div>
        </div>
        <c:forEach items="${goalvo}" var="gvo">
            <div class="rountin-goal-title-list" >
                <div class="routine-goal-title pink">
                    <div class="emphasis">${gvo.todoTitle}</div>
                    <div class="badge">
                        <div class="black-plus icon-10"></div>
                    </div>
                </div>
            </div>
        </c:forEach>
        <!-- ///////////////////////////////////////////////////////////////루틴 목표/////////////////////////////////////////////////////////////// -->

        <div class="routine-content" style="display: none;">
            <div class="routine-title">
                <div class="routine-input-box">
                    <input type="text" class="routine-title-write op-8" placeholder="루틴 입력">
                    <div class="underscore"></div>
                </div>
            </div>
            <div class="routine-menu date-modal-button">
                <div class="routine-date-item routine-start">시작 날짜</div>
                <div class="emty">없음</div>
            </div>

            <div class="divider"></div>

            <div class="routine-menu date-modal-button">
                <div class="routine-date-item routine-finish">종료 날짜</div>
                <div class="emty">없음</div>
            </div>

            <div class="divider"></div>

            <div class="routine-menu">
                <div class="routine-every-day-item routine-every">매일</div>
                <label class="switch">
                    <input type="checkbox" class="mySwitch">
                    <span class="slider"></span>
                </label>
            </div>

            <div class="divider"></div>

            <div class="routine-menu todo-alarm-modal-button">
                <div class="routine-every-day-item routine-time">시간</div>
                <div class="emty">없음</div>
            </div>

            <div class="divider"></div>

            <div class="routine-menu">
                <div class="routine-setting-feed-work-plus">피드에서 수동으로 할 일 추가</div>
                <label class="switch">
                    <input type="checkbox" class="mySwitch">
                    <span class="slider"></span>
                </label>
            </div>

            <div class="divider"></div>
            <button type="button" class="routine-delete-button">삭제</button>

        </div>

    </div>
</div>


<!-- ///////////////////////////////////////////////////////////////검은 모달/////////////////////////////////////////////////////////////// -->

<div class="routine-black-modal"></div>

<!-- ///////////////////////////////////////////////////////////////시작 모달/////////////////////////////////////////////////////////////// -->

<div class="date-modal">
    <div class="date-title">
        <div class="gray-slice-bar"></div>
        <div class="date-start-title start">시작 날짜</div>
    </div>
    <div class="date-month">
        <div class="today-month">2024년 6월</div>
        <div class="black-arrow-items">
            <div class="black-left-arrow icon-22"></div>
            <div class="black-right-arrow icon-22"></div>
        </div>
    </div>
    <div class="date-calendar">
        <div class="date-week">
            <div class="date-week-item sun">일</div>
            <div class="date-week-item">월</div>
            <div class="date-week-item">화</div>
            <div class="date-week-item">수</div>
            <div class="date-week-item">목</div>
            <div class="date-week-item">금</div>
            <div class="date-week-item">토</div>
        </div>
        <div class="date-day-bundle first">
            <div class="emty-div"></div>
            <div class="date-first-focus">
                <div class="date-day-item first-focus-setting">1</div>
            </div>
        </div>
        <div class="date-day-bundle">
            <div class="date-day-item special">2</div>
            <div class="date-day-item">3</div>
            <div class="date-day-item">4</div>
            <div class="date-day-item">5</div>
            <div class="date-day-item">6</div>
            <div class="date-day-item">7</div>
            <div class="date-choose-focus">
                <div class="date-day-item choose-focus-setting">8</div>
            </div>
        </div>
        <div class="date-day-bundle">
            <div class="date-day-item special">9</div>
            <div class="date-day-item">10</div>
            <div class="date-day-item">11</div>
            <div class="date-day-item">12</div>
            <div class="date-day-item">13</div>
            <div class="date-day-item">14</div>
            <div class="date-day-item">15</div>
        </div>
        <div class="date-day-bundle">
            <div class="date-day-item special">16</div>
            <div class="date-day-item">17</div>
            <div class="date-day-item">18</div>
            <div class="date-day-item">19</div>
            <div class="date-day-item">20</div>
            <div class="date-day-item">21</div>
            <div class="date-day-item">22</div>
        </div>
        <div class="date-day-bundle">
            <div class="date-day-item special">23</div>
            <div class="date-day-item">24</div>
            <div class="date-day-item">25</div>
            <div class="date-day-item">26</div>
            <div class="date-day-item">27</div>
            <div class="date-day-item">28</div>
            <div class="date-day-item">29</div>
        </div>
        <div class="date-day-bundle finaly">
            <div class="date-day-item">30</div>
            <div class="finaly-emty-div"></div>
        </div>
    </div>
    <div class="ok-box">
        <div class="ok">확인</div>
    </div>
</div>

<!-- ///////////////////////////////////////////////////////////////시간 설정 모달/////////////////////////////////////////////////////////////// -->

<div class="todo-alarm-modal">
    <div class="todo-alarm-title">
        <div class="gray-slice-bar"></div>
        <div class="alarm-title">시간 설정</div>
    </div>
    <div class="todo-am-pm-box">
        <div class="text">오전/오후</div>
        <div class="todo-am-pm-selector">
            <div class="todo-am-button">
                <div class="am">오전</div>
            </div>
            <div class="todo-pm-button">
                <div class="pm">오후</div>
            </div>
        </div>
    </div>
    <div class="todo-hour-box">
        <div class="text">시</div>
        <div class="todo-hour-selector">
            <div class="todo-items selected">
                <div class="todo-item">1</div>
            </div>
            <div class="todo-items">
                <div class="todo-item">2</div>
            </div>
            <div class="todo-items">
                <div class="todo-item">3</div>
            </div>
            <div class="todo-items">
                <div class="todo-item">4</div>
            </div>
            <div class="todo-items">
                <div class="todo-item">5</div>
            </div>
            <div class="todo-items">
                <div class="todo-item">6</div>
            </div>
            <div class="todo-items">
                <div class="todo-item">7</div>
            </div>
            <div class="todo-items">
                <div class="todo-item">8</div>
            </div>
            <div class="todo-items">
                <div class="todo-item">9</div>
            </div>
            <div class="todo-items">
                <div class="todo-item">10</div>
            </div>
            <div class="todo-items">
                <div class="todo-item">11</div>
            </div>
            <div class="todo-items">
                <div class="todo-item">12</div>
            </div>
        </div>
    </div>

    <div class="todo-hour-box">
        <div class="text">분</div>
        <div class="todo-hour-selector">
            <div class="todo-items selected">
                <div class="todo-item">00</div>
            </div>
            <div class="todo-items">
                <div class="todo-item">05</div>
            </div>
            <div class="todo-items">
                <div class="todo-item">10</div>
            </div>
            <div class="todo-items">
                <div class="todo-item">15</div>
            </div>
            <div class="todo-items">
                <div class="todo-item">20</div>
            </div>
            <div class="todo-items">
                <div class="todo-item">25</div>
            </div>
            <div class="todo-items">
                <div class="todo-item">30</div>
            </div>
            <div class="todo-items">
                <div class="todo-item">35</div>
            </div>
            <div class="todo-items">
                <div class="todo-item">40</div>
            </div>
            <div class="todo-items">
                <div class="todo-item">45</div>
            </div>
            <div class="todo-items">
                <div class="todo-item">50</div>
            </div>
            <div class="todo-items">
                <div class="todo-item">55</div>
            </div>
        </div>
    </div>
    <div class="todo-alarm-ok-button">
        <div class="todo-alarm-ok">완료</div>
    </div>
</div>
<!-- ///////////////////////////////////////////////////////////삭제확인모달/////////////////////////////////////////////////////////// -->

<div class="routine-delete-modal">
    <div class="routine-delete-message">
        <div>할 일 항목들을 삭제하시겠습니까?</div>
        <div> 삭제된 항목들은 되돌릴 수 없습니다.</div>
    </div>
    <div class="routine-delete-select-buttons">
        <div class="routine-delete-cancel">
            취소
        </div>
        <div class="routine-delete-ok">
            확인
        </div>
    </div>
</div>


</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<meta name="viewport" content="initial-scale=1, width=device-width">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" />
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto Sans KR:wght@300;500&display=swap" />
	<link href="${path}/resources/goal/style.css" type="text/css" rel="stylesheet" />
	<link href="${path}/resources/app.css" type="text/css" rel="stylesheet" />
	<script src="${path}/resources/goal/script.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<div class="goal-title-page">
	<div class="goal-container">
		<div class="goal-header">
			<div class="black-left-arrow icon-28"></div>
			<div class="emphasis">목표 </div>
			<div class="goal-add-button">
				<div class="black-plus icon-16"></div>
			</div>
		</div>
		<div class="goal-list">

			<c:forEach items="${tvo}" var="item">
				<div class="goal-item" style="color: red">❤️️1순위❤️
					<input type="hidden" name="todo-title-id" value="${item.todo_title_id}">
					<input type="hidden" name="color-id" value="${item.color_id}">
					<input type="hidden" name="email" value="${item.email}">
					<input type="hidden" name="todo-title" value="${item.todo_title}">
					<input type="hidden" name="title-todo-open" value="${item.title_todo_open}">
				</div>
			</c:forEach>

		</div>
	</div>
	<div></div>
</div>

<!--------------------------------------------goal write---------------------------------------------->
<div class="goal-plan-page">
	<div class="goal-plan-update">
		<div class="goal-plan-header">
			<div class="goal-list-page-move">
				<div class="black-left-arrow icon-28"></div>
			</div>
			<b class="emphasis">목표 수정</b>
			<div class="emphasis goal-plan-complete-btn">완료</div>
		</div>
		<div class="goal-plan-contents">
			<div class="goal-input-box">
				<input class="goal-text-input" placeholder="목표 입력">
				<div class="goal-divide-line">
				</div>
			</div>
			<div class="goal-plan-option">
				<div>공개설정</div>
				<div class="goal-plan-open-setting-modal-button">
					<div class="goal-plan-open-setting-icon">
						<div class="black-earth icon-16 op-6"></div>
					</div>
					<div class="goal-plan-open-setting-text emphasis">전체 공개</div>
					<div class="white-hard-drop-down icon-8"></div>
				</div>
			</div>
			<div class="divider"></div>
			<div class="goal-plan-option">
				<div>색상</div>
				<div class="color-drop-down goal-color-open-setting goal-select-color-button">
					<div class="select-color">
					</div>
					<div class="white-hard-drop-down icon-8"></div>
				</div>
			</div>
			<div class="divider"></div>
			<div class="goal-selected-buttons">
				<div class="goal-finish-modal-button goal-select-button">
					<div class="emphasis">종료하기</div>
				</div>
				<div class="goal-delete-modal-button goal-select-button">
					<div class="emphasis">삭제</div>
				</div>
			</div>
		</div>
	</div>
</div>


<!---------------------------------------------- 모달 ------------------------------------------------->



<div class="goal-black-modal">
</div>

<div class="finish-modal">
	<div class="finish-title">
		<div class="gray-slice-bar">
		</div>
		<div class="quit-title">종료하기</div>
	</div>
	<div class="finish-content">
		<div class="finish-list">
			<div class="goal-complete finish-menu selected">
				<div class="finish-item">
					<div class="color-goal icon-24"></div>
					<div class="goal-text">목표를 달성했어요!</div>
				</div>
				<div class="blue-radio icon-22"></div>
			</div>
			<div class="goal-time-out finish-menu">
				<div class="finish-item">
					<div class="color-time-off icon-24"></div>
					<div class="goal-text">기간이 종료됐어요!</div>
				</div>
				<div class="empty-black-circle icon-24 op-4"></div>
			</div>
			<div class="goal-relax-stop finish-menu">
				<div class="finish-item">
					<div class="sad-emogi icon-24"></div>
					<div class="goal-text">아쉽지만 그만할래요</div>
				</div>
				<div class="empty-black-circle icon-24 op-4"></div>
			</div>
		</div>
	</div>
	<div class="goal-finish-modal-ok-button">
		확인
	</div>
</div>

<div class="color-modal">
	<div class="color-content">
		<div class="gray-slice-bar">
		</div>
		<div class="title">색상</div>
		<div class="color-box">
			<div class="badge-items">
				<div class="badge-basic badge-item">
					<div class="goal-text">기본</div>
				</div>
				<div class="badge-feeling badge-item">
					<div class="goal-text">따뜻함</div>
				</div>
				<div class="badge-feeling badge-item">
					<div class="goal-text">시원함</div>
				</div>
			</div>
			<div class="color-items">
				<div class="color-item color-selected">
					<input type="hidden" name="color-id" value="1">
				</div>
				<div class="color-item" style="background-color: #282F59;">
					<input type="hidden" name="color-id" value="2">
				</div>
				<div class="color-item" style="background-color: #1E2F98;">
					<input type="hidden" name="color-id" value="3">
				</div>
				<div class="color-item" style="background-color: #2857AA;">
					<input type="hidden" name="color-id" value="4">
				</div>
				<div class="color-item" style="background-color: #0076FF;">
					<input type="hidden" name="color-id" value="5">
				</div>
				<div class="color-item" style="background-color: #1BA7EC;">
					<input type="hidden" name="color-id" value="6">
				</div>
				<div class="color-item" style="background-color: #B964F4;">
					<input type="hidden" name="color-id" value="7">
				</div>
				<div class="color-item" style="background-color: #785CB4;">
					<input type="hidden" name="color-id" value="8">
				</div>
				<div class="color-item" style="background-color: #7300AB;">
					<input type="hidden" name="color-id" value="9">
				</div>
				<div class="color-item" style="background-color: #797EF6;">
					<input type="hidden" name="color-id" value="10">
				</div>
				<div class="color-item" style="background-color: #4B13FE;">
					<input type="hidden" name="color-id" value="11">
				</div>
				<div class="color-item" style="background-color: #6236FF;">
					<input type="hidden" name="color-id" value="12">
				</div>
				<div class="color-item" style="background-color: #2F9399;">
					<input type="hidden" name="color-id" value="13">
				</div>
				<div class="color-item" style="background-color: #45A062;">
					<input type="hidden" name="color-id" value="14">
				</div>
				<div class="color-item" style="background-color: #346F75;">
					<input type="hidden" name="color-id" value="15">
				</div>
				<div class="color-item" style="background-color: #8DC540;">
					<input type="hidden" name="color-id" value="16">
				</div>
				<div class="color-item" style="background-color: #00D43E;">
					<input type="hidden" name="color-id" value="17">
				</div>
				<div class="color-item" style="background-color: #818A4B;">
					<input type="hidden" name="color-id" value="18">
				</div>
				<div class="color-item" style="background-color: #FA9B89;">
					<input type="hidden" name="color-id" value="19">
				</div>
				<div class="color-item" style="background-color: #FF6DC2;">
					<input type="hidden" name="color-id" value="20">
				</div>
				<div class="color-item" style="background-color: #FF2C9E;">
					<input type="hidden" name="color-id" value="21">
				</div>
				<div class="color-item" style="background-color: #EB7480;">
					<input type="hidden" name="color-id" value="22">
				</div>
				<div class="color-item" style="background-color: #F54E5E;">
					<input type="hidden" name="color-id" value="23">
				</div>
				<div class="color-item" style="background-color: #CB2F49;">
					<input type="hidden" name="color-id" value="24">
				</div>
				<div class="color-item" style="background-color: #FACE34;">
					<input type="hidden" name="color-id" value="25">
				</div>
				<div class="color-item" style="background-color: #FF910D;">
					<input type="hidden" name="color-id" value="26">
				</div>
				<div class="color-item" style="background-color: #EB6B2B;">
					<input type="hidden" name="color-id" value="27">
				</div>
				<div class="color-item" style="background-color: #DC9B1D;">
					<input type="hidden" name="color-id" value="28">
				</div>
				<div class="color-item" style="background-color: #9D7856;">
					<input type="hidden" name="color-id" value="29">
				</div>
				<div class="color-item" style="background-color: #744523;">
					<input type="hidden" name="color-id" value="30">
				</div>
				<div class="color-item" style="background-color: #01A8A8;">
					<input type="hidden" name="color-id" value="31">
				</div>
				<div class="color-item" style="background-color: #00C0A8;">
					<input type="hidden" name="color-id" value="32">
				</div>
				<div class="color-item" style="background-color: #04DF91;">
					<input type="hidden" name="color-id" value="33">
				</div>
				<div class="color-item" style="background-color: #41D9E7;">
					<input type="hidden" name="color-id" value="34">
				</div>
				<div class="color-item" style="background-color: #64C3C9;">
					<input type="hidden" name="color-id" value="35">
				</div>
				<div class="color-item" style="background-color: #70A2DB;">
					<input type="hidden" name="color-id" value="36">
				</div>
				<div class="color-item" style="background-color: #FE6B9A;">
					<input type="hidden" name="color-id" value="37">
				</div>
				<div class="color-item" style="background-color: #FE93B5;">
					<input type="hidden" name="color-id" value="38">
				</div>
				<div class="color-item" style="background-color: #FCB2CB;">
					<input type="hidden" name="color-id" value="39">
				</div>
				<div class="color-item" style="background-color: #C6D657;">
					<input type="hidden" name="color-id" value="40">
				</div>
				<div class="color-item" style="background-color: #95BB8C;">
					<input type="hidden" name="color-id" value="41">
				</div>
				<div class="color-item" style="background-color: #608C4D;">
					<input type="hidden" name="color-id" value="42">
				</div>
				<div class="color-item" style="background-color: #766F85;">
					<input type="hidden" name="color-id" value="43">
				</div>
				<div class="color-item" style="background-color: #81939C;">
					<input type="hidden" name="color-id" value="44">
				</div>
				<div class="color-item" style="background-color: #A79B97;">
					<input type="hidden" name="color-id" value="45">
				</div>
				<div class="color-item" style="background-color: #CFB290;">
					<input type="hidden" name="color-id" value="46">
				</div>
				<div class="color-item" style="background-color: #B8666B;">
					<input type="hidden" name="color-id" value="47">
				</div>
				<div class="color-item" style="background-color: #62223C;">
					<input type="hidden" name="color-id" value="48">
				</div>
			</div>
		</div>
	</div>
</div>

<div class="open-setting-modal">
	<div class="open-setting-modal-position">
		<div class="gray-slice-bar">
		</div>
		<div class="title">공개설정</div>
	</div>
	<div class="open-setting-items">
		<div class="global-open open-setting-menu selected">
			<div class="finish-item">
				<div class="black-earth icon-24 op-5"></div>
				<div class="text">전체 공개</div>
			</div>
			<div class="blue-radio icon-22"></div>
		</div>
		<div class="follow-open open-setting-menu">
			<div class="finish-item">
				<div class="black-group-icon">
					<div class="black-group icon-24 op-5"></div>
				</div>
				<div class="text">팔로워 공개</div>
			</div>
			<div class="empty-black-circle icon-24 op-4"></div>
		</div>
		<div class="private-open open-setting-menu">
			<div class="finish-item">
				<div class="black-lock-icon op-9">
					<div class="black-lock-position">
						<div class="black-lock icon-24 op-5"></div>
					</div>
				</div>
				<div class="text">나만보기</div>
			</div>
			<div class="empty-black-circle icon-24 op-4"></div>
		</div>
	</div>
	<div class="open-setting-select-ok-button">
		확인
	</div>
</div>

<!------------------------------------ 목표 종료 재확인 모달 창-------------------------------------->

<div class="goal-finish-message-modal">
	<div class="goal-finish-message-white-background">
		<div class="goal-finish-message-modal-contents">
			<div class="goal-finish-message-modal-font">
				<p class="p">목표를 종료하시겠습니까? </p>
				<p class="p">기존의 할 일 목록은 유지되지만 </p>
				<p class="p">새로운 입력은 제한됩니다.</p>
			</div>
			<div class="goal-finish-message-button-box">
				<div class="goal-finish-message-cancel-button">
					<div>취소</div>
				</div>
				<div class="goal-finish-message-ok-button">
					<div>확인</div>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="goal-delete-modal">
	<div class="goal-delete-message">
		<div>목표를 삭제하시겠습니까?</div>
	</div>
	<div class="goal-delete-select-buttons">
		<div class="goal-delete-cancel">
			취소
		</div>
		<div class="goal-delete-ok">
			확인
		</div>
	</div>
</div>
</body>
</html>
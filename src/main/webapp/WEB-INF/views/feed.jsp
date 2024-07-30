<!DOCTYPE html>
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
	<script src="script.js"></script>
	<link rel="stylesheet" href="style.css" />
	<link rel="stylesheet" href="../../../../../../frontend%20-%20복사본/app.css" />
</head>

<body>
	<div class="feed-page">
		<div class="feed-container">
			<div class="feed-contents">
				<div class="feed-top">
					<div class="feed-header">
						<div class="tode-logo icon-60"></div>
						<!-- 목표관리 설정 더보기 버튼 -->
						<div class="feed-more">
							<div class="feed-more-icon black-more icon-20 op-7">
							</div>
							<div class="feed-more-drop-down hidden">
								<div class="goal-add drop-down-menu">
									<div>목표 등록</div>
									<div class="blue-plus icon-16"></div>
								</div>
								<div class="divider">
								</div>
								<div class="goal-edit drop-down-menu">
									<div>목표 관리</div>
								</div>
								<div class="divider">
								</div>
								<div class="routine-edit drop-down-menu">
									<div>루틴 관리</div>
								</div>
								<div class="divider">
								</div>
								<div class="logout drop-down-menu">
									<div>로그아웃</div>
								</div>
							</div>
						</div>
					</div>
					<div class="follow-bar">
						<!-- 본인 프로필  -->
						<div class="feed-follow-profile-box">
							<div class="user-profile-image">
								<div class="white-default-profile icon-48"></div> <!-- 나중에 조건문을 달 예정 -->
							</div>
							<div class="user-nickname">me</div>
						</div>
						<!-- 다른 사용자 프로필 이미지 -->
						<div class="feed-follow-profile-box">
							<div class="follow-profile-image">
								<div class="white-default-profile icon-48"></div> <!-- 나중에 조건문을 달 예정 -->
							</div>

							<div class="nickname">팔로워</div>
						</div>
						<!-- 팔로우 페이지로 이동 -->
						<div class="follower-more-button">
							<div class="white-right-arrow icon-22"></div>
						</div>
					</div>
				</div>
				<!-- 피드 메인 컨텐츠 -->
				<div class="feed-bottom">
					<!-- 왼쪽 피드  -->
					<div class="main-left">
						<!-- 본인 프로필 박스-->
						<div class="profile-box">
							<div class="user-profile-image">
								<div class="white-default-profile icon-52"></div>
							</div>
							<div class="user-profile-text">
								<div class="profile-name-box">
									<div class="profile-name emphasis">Kugring</div>
									<div class="profile-edit">
										<div class="blue-edit-pen icon-12"></div>
									</div>
								</div>
								<div class="self-introduction">세상 최강 코딩러가 되기 위해 열심히 공부하는 코린이</div>
							</div>
						</div>
						<!-- 달력 날짜 & 카운터 -->
						<div class="calendar-title-box">
							<div class="calendar-items">
								<b class="calendar-date-text">2024년 6월</b>
								<div class="calendar-counters">
									<!-- 투두 카운터 -->
									<div class="todo-counter counter-box">
										<div class="blue-check-box icon-16"></div>
										<div class="todo-counter-num emphasis">3</div>
									</div>
									<!-- 일기 카운터 -->
									<div class="diary-counter counter-box">
										<div class="smile-face icon-16"></div>
										<div class="diary-counter-num">3</div>
									</div>
									<!-- 공감 카운터 -->
									<div class="gonggam-counter counter-box">
										<div class="pink-heart icon-16"></div>
										<div class="gonggam-counter-num">3</div>
									</div>
								</div>
							</div>
							<!-- 월별 선택자 -->
							<div class="month-selector">
								<div class="black-bold-left-arrow icon-16"></div>
								<div class="black-bold-right-arrow icon-16"></div>
							</div>
						</div>
						<!-- 주간 요일 -->
						<div class="week-days">
							<div>일</div>
							<div>월</div>
							<div>화</div>
							<div>수</div>
							<div>목</div>
							<div>금</div>
							<div>토</div>
						</div>
						<!-- 일별 그래프 전체 묶음 -->
						<div class="calendar-date">
							<div class="date-item">
								<div class="donut-chart">
									<div class="donut-fill">
									</div>
									<div class="donut-center">
									</div>
								</div>
								<div class="date-num">16</div>
								<input class="todo-date-data" type="hidden" name="todoDate" value="2024-07-16">
							</div>
							<div class="date-item">
								<div class="donut-chart">
									<div class="donut-fill">
									</div>
									<div class="donut-center">
									</div>
								</div>
								<div class="date-num">17</div>
								<input class="todo-date-data" type="hidden" name="todoDate" value="2024-07-17">

							</div>
							<div class="date-item">
								<div class="donut-chart">
									<div class="donut-fill">
									</div>
									<div class="donut-center">
									</div>
								</div>
								<div class="date-num">18</div>
								<input class="todo-date-data" type="hidden" name="todoDate" value="2024-07-18">
							</div>
						</div>
					</div>
					<!-- 오른쪽 피드 -->
					<div class="feed-right todo-container">
						<!-- 투두 박스 -->
						<div class="todo-box">
							<!-- 투두 목표 이름 -->
							<div class="todo-title">
								<div class="title-badge">
									<div class="black-earth icon-18 op-4"></div>
									<div class="title-name">전체 공개</div>
									<div class="todo-add">
										<div class="white-round-plus icon-16"></div>
									</div>
								</div>
								<div class="todo-toggle black-up-arrow icon-22 op-5 sc-7"></div>
							</div>
							<!-- 투두 리스트 -->
							<div class=" todo-list">
								<div class="finished-todo todo-item">
									<div class="todo-bundle">
										<div class="todo-check-box blue-check-box  medium-icon icon-22"></div>
										<div class="todo-detail">
											<div class="todo-text">노력은 배신하지 않는다!</div>
											<div class="todo-alarm"></div>
										</div>
									</div>
									<div class="todo-modal-button">
										<div class="black-width-menu icon-22 op-4 sc-7"></div>
									</div>
									<input type="hidden" name="todo_memo_data" value="다만, 매우 엄청난 노력이 필요할뿐...." />
									<input type="hidden" name="todo-id" value="1">
								</div>
								<div class="current-todo todo-item">
									<div class="todo-bundle">
										<div class="todo-check-box empty-black-box medium-icon icon-22 op-6"></div>
										<div class="todo-detail">
											<div class="todo-text">스프링 공부했던거 다시 복습해보기!</div>
											<div class="todo-alarm">
												<div class="black-clock icon-8 op-4"></div>
												<div>AM 7:05</div>
											</div>
										</div>
									</div>
									<div class="todo-modal-button">
										<div class="black-width-menu icon-22 op-4 sc-7"></div>
									</div>
									<input type="hidden" name="todo_memo_data" value="" />
									<input type="hidden" name="todo-id" value="2">
								</div>
								<div class="coming-todo todo-item">
									<div class="todo-bundle">
										<div class="todo-check-box empty-black-box medium-icon icon-22 op-6"></div>
										<div class="todo-detail">
											<div class="todo-text">팀프로젝트_회의 날짜 잡기</div>
											<div class="todo-alarm"></div>
										</div>
									</div>
									<div class="routine-todo-add-button">
										<div class="black-medium-plus icon-22 op-6"></div>
									</div>
									<input type="hidden" name="todo_memo_data" value="" />
									<input type="hidden" name="todo-id" value="3">
								</div>
							</div>
						</div>
						<div class="todo-box">
							<div class="todo-title">
								<div class="title-badge">
									<div class="black-group icon-18 op-4"></div>
									<div class="title-name">팔로워 공개</div>
									<div class="todo-add">
										<div class="white-round-plus icon-16"></div>
									</div>
								</div>
								<div class="todo-toggle black-up-arrow icon-22 op-5 sc-7"></div>
							</div>
							<div class="todo-list">
								<div class="current-todo todo-item">
									<div class="todo-bundle">
										<div class="todo-check-box empty-black-box medium-icon icon-22 op-6"></div>
										<div class="todo-detail">
											<div class="todo-text">일어나서 이불개기</div>
											<div class="todo-alarm">
												<div class="black-clock icon-8 op-4"></div>
												<div class="alarm-text">AM 7:00</div>
											</div>
										</div>
									</div>
									<div class="todo-modal-button">
										<div class="black-width-menu icon-22 op-4 sc-7"></div>
									</div>
									<input type="hidden" name="todo_memo_data" value="" />
									<input type="hidden" name="todo-id" value="4">
								</div>
								<div class="current-todo todo-item">
									<div class="todo-bundle">
										<div class="todo-check-box empty-black-box medium-icon icon-22 op-6"></div>

										<div class="todo-detail">
											<div class="todo-text">방청소 하기</div>
											<div class="todo-alarm"></div>
										</div>
									</div>
									<div class="todo-modal-button">
										<div class="black-width-menu icon-22 op-4 sc-7"></div>
									</div>
									<input type="hidden" name="todo_memo_data" value="" />
									<input type="hidden" name="todo-id" value="5">
								</div>
								<div class="coming-todo todo-item">
									<div class="todo-bundle">
										<div class="todo-check-box empty-black-box medium-icon icon-22 op-6"></div>

										<div class="todo-detail">
											<div class="todo-text">창문열고 환기하기</div>
											<div class="todo-alarm">
												<div class="black-clock icon-8 op-4"></div>
												<div class="alarm-text">AM 7:05</div>
											</div>
										</div>
									</div>
									<div class="routine-todo-add-button">
										<div class="black-medium-plus icon-22 op-6"></div>
									</div>
									<input type="hidden" name="todo_memo_data" value="" />
									<input type="hidden" name="todo-id" value="6">
								</div>
								<div class="coming-todo todo-item">
									<div class="todo-bundle">
										<div class="todo-check-box empty-black-box medium-icon icon-22 op-6"></div>

										<div class="todo-detail">
											<div class="todo-text">지각하지 않고 학원 잘 도착하기!</div>
											<div class="todo-alarm"></div>
										</div>
									</div>
									<div class="routine-todo-add-button">
										<div class="black-medium-plus icon-22 op-6"></div>
									</div>
									<input type="hidden" name="todo_memo_data" value="" />
									<input type="hidden" name="todo-id" value="7">
								</div>
							</div>
						</div>
						<div class="todo-box">
							<div class="todo-title">
								<div class="title-badge">
									<div class="black-lock icon-18 op-4"></div>
									<div class="title-name">본인만 공개</div>
									<div class="todo-add">
										<div class="white-round-plus icon-16"></div>
									</div>
								</div>
								<div class="todo-toggle black-up-arrow icon-22 op-5 sc-7"></div>
							</div>
							<div class="todo-list">
								<div class="current-todo todo-item">
									<div class="todo-bundle">
										<div class="todo-check-box empty-black-box medium-icon icon-22 op-6"></div>

										<div class="todo-detail">
											<div class="todo-text">몸무게 측정하기</div>
											<div class="todo-alarm">
												<div class="black-clock icon-8 op-4"></div>
												<div class="alarm-text">AM 7:00</div>
											</div>
										</div>
									</div>
									<div class="todo-modal-button">
										<div class="black-width-menu icon-22 op-4 sc-7"></div>
									</div>
									<input type="hidden" name="todo_memo_data" value="" />
									<input type="hidden" name="todo-id" value="8">
								</div>
								<div class="current-todo todo-item">
									<div class="todo-bundle">
										<div class="todo-check-box empty-black-box medium-icon icon-22 op-6"></div>

										<div class="todo-detail">
											<div class="todo-text">오늘 학원 수업 잘 듣기</div>
											<div class="todo-alarm"></div>
										</div>
									</div>
									<div class="todo-modal-button">
										<div class="black-width-menu icon-22 op-4 sc-7"></div>
									</div>
									<input type="hidden" name="todo_memo_data" value="" />
									<input type="hidden" name="todo-id" value="9">
								</div>
								<div class="coming-todo todo-item">
									<div class="todo-bundle">
										<div class="todo-check-box empty-black-box medium-icon icon-22 op-6"></div>

										<div class="todo-detail">
											<div class="todo-text">허리 조심하기!!</div>
											<div class="todo-alarm">
												<div class="black-clock icon-8 op-4"></div>
												<div class="alarm-text">AM 7:05</div>
											</div>
										</div>
									</div>
									<div class="routine-todo-add-button">
										<div class="black-medium-plus icon-22 op-6"></div>
									</div>
									<input type="hidden" name="todo_memo_data" value="" />
									<input type="hidden" name="todo-id" value="10">
								</div>
								<div class="coming-todo todo-item">
									<div class="todo-bundle">
										<div class="todo-check-box empty-black-box medium-icon icon-22 op-6"></div>

										<div class="todo-detail">
											<div class="todo-text">자기전에 애플워치 충전하기</div>
											<div class="todo-alarm"></div>
										</div>
									</div>
									<div class="routine-todo-add-button">
										<div class="black-medium-plus icon-22 op-6"></div>
									</div>
									<input type="hidden" name="todo_memo_data" value="" />
									<input type="hidden" name="todo-id" value="11">
								</div>
							</div>
						</div>
						<!-- 하단 구부선 -->
						<div class="dot-divider">
						</div>
						<!-- 전체 더보기 버튼 -->
						<div class="total-todo-more-buttom">
							<div class="black-width-menu icon-16"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 각 페이지별 이동 아이콘 -->
		<div class="feed-footer">
			<div class="url-button selected">
				<div class="black-home icon-22"></div>
				<div>피드</div>
			</div>
			<div class="url-button">
				<div class="black-compass icon-22"></div>
				<div>둘러보기</div>
			</div>
			<div class="url-button">
				<div class="black-bell icon-22"></div>
				<div>알람</div>
			</div>
			<div class="url-button">
				<div class="black-man icon-22"></div>
				<div>My</div>
			</div>
		</div>
	</div>

	<!-- 검은 모달 화면 -->
	<div class="feed-modal"></div>

	<!-- 아이템 모달 -->
	<div class="todo-item-modal">
		<div class="todo-item-title">
			<div class="gray-slice-bar">
			</div>
			<div class="todo-item-name">노력은 배신하지 않는다!</div>
		</div>
		<div class="todo-item-menus">
			<div class="todo-item-select-buttons">
				<div class="todo-item-edit-button">
					<div class="blue-edit-todo icon-22">
					</div>
					<div>수정하기</div>
				</div>
				<div class="todo-item-delete-button">
					<div class="red-todo-delete icon-22">
					</div>
					<div>삭제하기</div>
				</div>
			</div>
			<div class="todo-item-data">
				<div class="todo-item-memo todo-item-menu">
					<div class="memo-icon icon-30">
					</div>
					<div>메모</div>
				</div>
				<div class="todo-item-alarm todo-item-menu">
					<div class="alarm-icon icon-30">
					</div>
					<div>시간 알림</div>
				</div>
				<div class="todo-item-image todo-item-menu">
					<div class="image-icon icon-30">
					</div>
					<div>사진 인증</div>
				</div>
				<div class="todo-item-today-again todo-item-menu">
					<div class="today-again-icon icon-30">
					</div>
					<div>오늘 또 하기</div>
				</div>
				<div class="todo-item-tomorrow-again todo-item-menu">
					<div class="tomorrow-again-icon icon-30">
					</div>
					<div>내일 또 하기</div>
				</div>
				<div class="todo-item-anotherDay-again todo-item-menu">
					<div class="anotherDay-again-icon icon-30">
					</div>
					<div>다른 날 또 하기</div>
				</div>
				<div class="todo-item-day-change todo-item-menu">
					<div class="day-change-icon icon-30">
					</div>
					<div>날짜 바꾸기</div>
				</div>
				<div class="todo-item-today-move todo-item-menu">
					<div class="today-move-icon icon-30">
					</div>
					<div>오늘 하기</div>
				</div>
				<div class="todo-item-tomorrow-move todo-item-menu">
					<div class="tomorrow-move-icon icon-30">
					</div>
					<div>내일 하기</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 메모 모달 -->
	<div class="todo-memo-modal">
		<div class="todo-memo-title">
			<div class="gray-slice-bar">
			</div>
			<div class="todo-memo-name">투두_내용</div>
		</div>
		<textarea class="todo-memo-textarea" placeholder="할 일의 메모를 작성해주세요.&#10;작성된 메모는 본인만 볼 수 있어요."></textarea>
		<div class="meno-complete-button">
			<div>확인</div>
		</div>
	</div>

	<!-- 알람 모달 -->
	<div class="todo-alarm-modal">
		<div class="todo-alarm-title">
			<div class="gray-slice-bar">
			</div>
			<div class="todo-alarm-name emphasis">시간 설정</div>
		</div>
		<div class="todo-period-box">
			<div>오전/오후</div>
			<div class="todo-period-selector">
				<div class="todo-am-button period-item selected-period">
					오전
				</div>
				<div class="todo-pm-button period-item">
					오후
				</div>
			</div>
		</div>
		<div class="todo-hour-box">
			<div class="todo-alarm-text">시</div>
			<div class="todo-hour-selector">
				<div class="hour-item selected-hour">1</div>
				<div class="hour-item">2</div>
				<div class="hour-item">3</div>
				<div class="hour-item">4</div>
				<div class="hour-item">5</div>
				<div class="hour-item">6</div>
				<div class="hour-item">7</div>
				<div class="hour-item">8</div>
				<div class="hour-item">9</div>
				<div class="hour-item">10</div>
				<div class="hour-item">11</div>
				<div class="hour-item">12</div>
			</div>
		</div>
		<div class="todo-minute-box">
			<div class="todo-alarm-text">분</div>
			<div class="todo-minute-selector">
				<div class="minute-item selected-minute">00</div>
				<div class="minute-item">05</div>
				<div class="minute-item">10</div>
				<div class="minute-item">15</div>
				<div class="minute-item">20</div>
				<div class="minute-item">25</div>
				<div class="minute-item">30</div>
				<div class="minute-item">35</div>
				<div class="minute-item">40</div>
				<div class="minute-item">45</div>
				<div class="minute-item">50</div>
				<div class="minute-item">55</div>
			</div>
		</div>
		<div class="todo-alarm-buttons">
			<div class="todo-alarm-delete-button">삭제</div>
			<div class="todo-alarm-ok-button">완료</div>
		</div>
	</div>

	<!-- 캘렌더 모달 -->
	<div class="todo-calendar-modal">
		<div class="todo-calendar-title">
			<div class="gray-slice-bar">
			</div>
			<div class="todo-calendar-title-text">모든 할 일 복사</div>
		</div>
		<div class="todo-calendar-select-bar">
			<div class="selected-date">2024년 6월</div>
			<div class="todo-month-select-buttons">
				<div class="pre-month">
					<div class="black-bold-left-arrow icon-16"></div>
				</div>
				<div class="next-month">
					<div class="black-bold-right-arrow icon-16"></div>
				</div>
			</div>
		</div>
		<div class="todo-calendar-contents">
			<div class="todo-calendar-week-days">
				<div class="week-days-item sun">일</div>
				<div class="week-days-item">월</div>
				<div class="week-days-item">화</div>
				<div class="week-days-item">수</div>
				<div class="week-days-item">목</div>
				<div class="week-days-item">금</div>
				<div class="week-days-item">토</div>
			</div>
			<div class="todo-calendar-days">
				<!-- 나중에 자바스크립트로 들어갈 내용 -->
			</div>
		</div>
		<div class="todo-calendar-ok-button">
			확인
		</div>
	</div>


	<!-- 모든_투두_편집_모달 -->
	<div class="total-todo-modal">
		<div class="total-todo-title">
			<div class="gray-slice-bar">
			</div>
			<div class="emphasis">날짜별 할 일 수정</div>
		</div>
		<div class="total-todo-contents">
			<div class="total-todo-items">
				<div class="total-todo-tomorrow-move total-todo-menu selected">
					<div class="total-todo-menu-label">
						<div class="total-todo-tomorrow-move-icon icon-30"></div>
						<div>미완료 할일 내일 하기</div>
					</div>

					<div class="blue-radio icon-22"></div>
				</div>
				<div class="total-todo-anotherDay-move total-todo-menu">
					<div class="total-todo-menu-label">
						<div class="total-todo-anotherDay-move-icon icon-30"></div>
						<div>미완료 할 일 다른 날 하기</div>
					</div>
					<div class="empty-black-circle icon-24 op-4"></div>
				</div>
				<div class="total-todo-current-delete total-todo-menu">
					<div class="total-todo-menu-label">
						<div class="total-todo-current-delete-icon icon-30"></div>
						<div>미완료 할 일 삭제</div>
					</div>
					<div class="empty-black-circle icon-24 op-4"></div>
				</div>
				<div class="total-todo-all-copy total-todo-menu">
					<div class="total-todo-menu-label">
						<div class="total-todo-all-copy-icon icon-30"></div>
						<div>모든 할 일 복사</div>
					</div>
					<div class="empty-black-circle icon-24 op-4"></div>
				</div>
				<div class="total-todo-all-delete total-todo-menu">
					<div class="total-todo-menu-label">
						<div class="total-todo-all-delete-icon icon-30"></div>
						<div>모든 할 일 삭제</div>
					</div>
					<div class="empty-black-circle icon-24 op-4"></div>
				</div>
			</div>
			<div class="total-todo-selected-buttons">
				<div class="total-todo-selected-cancel">
					<div>취소</div>
				</div>
				<div class="total-todo-selected-ok">
					<div>확인</div>
				</div>
			</div>
		</div>
	</div>


	<div class="todo-delete-modal">
		<div class="todo-delete-message">
			<div>할 일 항목들을 삭제하시겠습니까?</div>
			<div> 삭제된 항목들은 되돌릴 수 없습니다.</div>
		</div>
		<div class="todo-delete-select-buttons">
			<div class="todo-delete-cancel">
				취소
			</div>
			<div class="todo-delete-ok">
				확인
			</div>
		</div>
	</div>

</body>

</html>
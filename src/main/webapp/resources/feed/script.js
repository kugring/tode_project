$(function () {

    //              variable: 연타 글릭 방지 코드               //
    let isClickAllowed = true; // 플래그 변수 초기화

    //              variable: 날짜 & 시간 관련             //
    var time_test = new Date();
    // 처음 데이터를 현재에 맞춤
    time_reset(time_test)

    // let time_test = '2024-07-17';
    var year, month, day, today_fact, futur_fact;
    var target_year = year;
    var target_month = month;
    var target_day = day;
    var target_date = time_test;

    //              variable: 아이템 모달에 선택되어진 투두의 id값에 대한 변수            //
    var selected_todo_id;
    var selected_todo_item;
    var selected_todo_title;
    var selected_todo_content_text;
    var selected_todo_memo_data;
    var selected_todo_alarm;
    var selected_todo_list;

    //              variable: 투두 완료, 미완료 카운터                  //
    var todo_container = $('.todo-container');
    var currentTodoCount = todo_container.find('.current-todo').length;

    //              variable: 피드 관련 모달 변수들             //
    var black_modal = $('.feed-modal');
    var todo_item_modal = $('.todo-item-modal')
    var todo_memo_modal = $('.todo-memo-modal')
    var todo_memo_textarea = $('.todo-memo-textarea');
    var todo_alarm_modal = $('.todo-alarm-modal')
    var todo_calendar_modal = $('.todo-calendar-modal')
    var todo_delete_modal = $('.todo-delete-modal')
    var total_todo_modal = $('.total-todo-modal')


    //              variable: 투두-아이템안에 있는 아이콘의 변수들             //
    var alarm_icon = $('.todo-item-alarm');
    var image_icon = $('.todo-item-image');
    var today_again_icon = $('.todo-item-today-again');
    var tomorrow_again_icon = $('.todo-item-tomorrow-again');
    var anotherDay_agian_icon = $('.todo-item-anotherDay-again');
    var today_move_icon = $('.todo-item-today-move');
    var tomorrow_move_icon = $('.todo-item-tomorrow-move');


    //              variable: 종합-투두안에 있는 아이콘의 변수들             //
    var total_todo_tomorrow_move_icon = $('.total-todo-tomorrow-move')
    var total_todo_anotherDay_move_icon = $('.total-todo-anotherDay-move')
    var total_todo_all_delete_icon = $('.total-todo-all-delet')


    //              variable: 삭제 관련 버튼들 변수 모음             //
    var total_todo_all_delete = $('.total-todo-all-delete');
    var total_todo_current_delete = $('.total-todo-current-delete');
    var todo_item_delete_button = $('.todo-item-delete-button');

    //              variable: 캘린더 관련 변수 모음              //
    var calendar_title = $('.todo-calendar-title-text')
    var todo_calendar_days = $('.todo-calendar-days');
    var pre_month = $('.pre-month')
    var next_month = $('.next-month')

    //              variable: 알람 관련 변수 모음              //
    var alarm_period_button = $('.period-item')
    var alarm_hour_button = $('.hour-item')
    var alarm_minute_button = $('.minute-item')
    var todo_alarm_ok_button = $('.todo-alarm-ok-button');

    //              variable: 종합 투두 라디오 버튼 관련 변수 모음              //
    var menu_item = $('.total-todo-menu');
    var selected_icon = 'blue-radio icon-22';
    var unselected_icon = 'empty-black-circle icon-24 op-4';








    //                                                                              function:  공동 모달 함수 모음 구역                                                                           //

    //             function : 모달 css 효과들에 대한 모음              //
    function show(modal) {
        modal.css('display', 'flex');
        modal[0].offsetHeight;
        modal.css('opacity', '1');
    }
    function hidden(modal) {
        modal.css('opacity', '0');
        setTimeout(() => {
            modal.css('display', 'none');
        }, 500);
    }
    function move_up(modal) {
        show(modal)
        modal.css('transform', 'translateY(0)');
    }
    function move_down(modal) {
        modal.css('transform', 'translateY(100%)');
        setTimeout(hidden, 300, modal);
    }
    //              function: 특정 요소의 클릭을 0.8초 동안 연속 클릭을 방지한다.               //
    function stop_click() {
        if (!isClickAllowed) return false;
        isClickAllowed = false; // 클릭 비활성화
        // 일정 시간 후 클릭 재활성화 (여기서는 1초 후)
        setTimeout(function () {
            isClickAllowed = true;
        }, 800);
        return true;
    }
    //              function: 날짜를 현재로 초기화함                //
    function time_reset(time) {
        let date = new Date(time);

        year = date.getFullYear(); // 년도
        month = date.getMonth() + 1; // 월 (0부터 시작하므로 +1을 해줘야 함)
        day = date.getDate(); // 날짜
        today_fact = isSameDay(date)
        futur_fact = isTodayOrFuture(date)
    }
    //              function: 상단 헤더에서 목표, 루틴 페이지 드롭다운                //
    function menu_dropDown() {
        var dropdown = $('.feed-more-drop-down');
        $(dropdown).toggleClass('hidden');
    }
    //              function: 해당 투두 box를 접게 만들어주는 코드                //
    function todoListToggle(todo_toggle_button) {
        // 해당 todo-list를 찾는다.
        var nextElement = $(todo_toggle_button).parent().next();
        //  투두리스트의 item개수를 카운트한다.
        var todo_length = nextElement.children().length;
        // 계산된 높이를 변수에 할당합니다.
        var todo_list_height = todo_length * 40 - 8;
        // 해당 todo-list의 높이를 하드코딩으로 조절한다.
        var toggle_open = nextElement.css('height', todo_list_height + 'px');
        // 토글의 open,close의 조건문에 따라 높이를 조절해준다.
        if (nextElement.css('height') === '0px') {
            toggle_open
        } else {
            nextElement.css('height', '0px');
        }
        // 클래스 변경으로 해당 아이콘의 종류를 변경한다.
        $(nextElement).toggleClass('hidden');
        $(todo_toggle_button).toggleClass('black-up-arrow black-down-arrow');
    }

    //              function: 피드에서 모든 모달을 종료하고 값을을 초가화한다               //
    function modal_end() {
        setTimeout(hidden, 100, black_modal)
        move_down(todo_item_modal)
        move_down(todo_memo_modal)
        move_down(todo_alarm_modal)
        move_down(todo_calendar_modal)
        move_down(total_todo_modal);
        hidden(todo_delete_modal);
        hidden_menu_icon()
        selected_todo_info_reset()

        clean_calendar_modal();
        todo_memo_textarea.val(''); // value 값을 빈 문자열로 설정하여 지웁니다.
    }
    //              function: 투두_아이템_모달에서 아이콘을 보이게 해줌             //
    function show_menu_icon(todo) {
        var finished = todo_finished(todo)
        futur_fact && alarm_icon.css('display', 'flex');
        finished && image_icon.css('display', 'flex')
        !today_fact && finished && today_again_icon.css('display', 'flex');
        today_fact && finished && tomorrow_again_icon.css('display', 'flex')
        finished && anotherDay_agian_icon.css('display', 'flex')
        !today_fact && !finished && today_move_icon.css('display', 'flex')
        today_fact && !finished && tomorrow_move_icon.css('display', 'flex')
    }
    //              function: 종합 투두_모달 아이콘 클릭시 current상태의 투두가 있는 경우에 해당 아이콘을 보여줌                //
    function show_total_menu_icon() {
        var current_todo_fact = currentTodoCount > 0;
        current_todo_fact && total_todo_tomorrow_move_icon.css('display', 'flex');
        current_todo_fact && total_todo_anotherDay_move_icon.css('display', 'flex');
        current_todo_fact && total_todo_current_delete.css('display', 'flex');
    }
    //              function: mdoal이 종료될때 모달 관련 아이콘을 다시 숨김             //
    function hidden_menu_icon() {
        // 투두 아이듬 모달 관련 아이콘
        alarm_icon.css('display', 'none')
        image_icon.css('display', 'none')
        today_again_icon.css('display', 'none')
        tomorrow_again_icon.css('display', 'none')
        anotherDay_agian_icon.css('display', 'none')
        today_move_icon.css('display', 'none')
        tomorrow_move_icon.css('display', 'none')

        // 종합 투두 모달 관련 아이콘
        total_todo_tomorrow_move_icon.css('display', 'none');
        total_todo_anotherDay_move_icon.css('display', 'none');
        total_todo_all_delete_icon.css('display', 'none');
    }
    //                  function:  해당 투두가 완료됬는지 확인해주는 함수                //
    function todo_finished(todo_button) {
        console.log($(todo_button).parent());
        return $(todo_button).parent().hasClass('finished-todo');
    }
    //                  function:  현재 페이지의 날짜 데이터가 오늘이 맞는지 확인해주는 함수                //
    function isSameDay(dateString) {
        // 주어진 날짜 문자열을 Date 객체로 변환
        const givenDate = new Date(dateString);

        // 현재 날짜를 Date 객체로 가져옴
        const now = new Date();

        // 연, 월, 일을 비교하여 같은지 확인
        const isSameYear = givenDate.getFullYear() === now.getFullYear();
        const isSameMonth = givenDate.getMonth() === now.getMonth();
        const isSameDate = givenDate.getDate() === now.getDate();

        return isSameYear && isSameMonth && isSameDate;
    }
    //                  function:  현재 페이지의 날짜가 오늘 이상인지 확인해주는 코드                //
    function isTodayOrFuture(dateString) {
        // 주어진 날짜 문자열을 Date 객체로 변환
        const givenDate = new Date(dateString);
        // 현재 날짜를 Date 객체로 가져오고 시간 정보를 00:00:00으로 설정
        const now = new Date();
        now.setHours(0, 0, 0, 0);
        // 주어진 날짜가 오늘 날짜와 같거나 이후인지를 비교
        return givenDate >= now;
    }





    //                                                                              function:  투두_편집 구역                                                                           //


    //              function: 아이템 모달로 선택되어진 투두의 정보를 출력하는 함수             //
    function selected_todo_info(selected_todo_id) {
        selected_todo_list = $(`[name="todo-id"][value="${selected_todo_id}"]`).parent().parent();
        selected_todo_title = $(`[name="todo-id"][value="${selected_todo_id}"]`).parent().parent().parent().find('.todo-title').text().trim();
        selected_todo_item = $(`[name="todo-id"][value="${selected_todo_id}"]`).parent()
        selected_todo_content_text = $(`[name="todo-id"][value="${selected_todo_id}"]`).parent().find('.todo-text').text().trim()
        selected_todo_alarm = $(`[name="todo-id"][value="${selected_todo_id}"]`).parent().find('.todo-alarm')
        selected_todo_memo_data = $(`[name="todo-id"][value="${selected_todo_id}"]`).parent().find(`[name="todo_memo_data"]`).val();
    }
    //              function: 선택된 투두의 정보를 제거 하는 코드             //
    function selected_todo_info_reset() {
        selected_todo_list = null;
        selected_todo_title = null;
        selected_todo_item = null;
        selected_todo_content_text = null;
        selected_todo_alarm = null;
        selected_todo_memo_data = null;
    }
    //              function: 투두를 더블클릭시 해당 투두의 텍스트를 수정할 수 있음             //
    function todoEdit_dbClick(todo) {
        // 해당 투두_아이템을 찾음
        let todo_list = $(todo).closest('.todo-list');
        let todo_item = $(todo).closest('.todo-item');
        console.log(todo_item);
        var can_edit = !$(todo).closest('.coming-todo').length;
        if (!can_edit) {
            return;
        }
        console.log("수정가능:" + can_edit)
        // div 요소를 input 요소로 변경
        var todoText = $(todo);
        var currentText = todoText.text().trim(); // 현재 텍스트 내용 가져오기
        console.log(currentText == '');
        console.log("currentText: " + currentText);
        var inputElement = $('<input type="text" class="todo-input">'); // input 요소 생성
        inputElement.val(currentText); // input 요소에 현재 텍스트 내용 설정
        todoText.replaceWith(inputElement); // .todo-text 요소를 input 요소로 교체

        // input 요소에 포커스 설정
        inputElement.focus();

        // input 요소에서 포커스가 벗어나면 변경된 내용 저장
        inputElement.on('blur', function () {
            var newText = $(this).val(); // 변경된 텍스트 내용 가져오기
            var newTodoText = $('<div class="todo-text"></div>');
            newTodoText.on('dblclick', function () {
                todoEdit_dbClick(this);
            });

            // 처음에 투두를 추가하고 이후에 ''공백으로 제출시 db로 데이터가 들어가지 않게 막는다.
            if (currentText == '' && newText == '') {
                todo_item.remove();
            }
            // 만일 새로 고치려는 데이터가 ''인 경우 기존의 텍스트로 다시 롤백
            else if (currentText != '' && newText == '') {
                newTodoText.text(currentText);
                $(this).replaceWith(newTodoText); // input 요소를 새로운 .todo-text 요소로 교체
            }
            // 만일 새로 고치려는 데이터가 ''인 경우 기존의 텍스트로 다시 롤백
            else if (newText != '' && currentText == '') {
                console.log("요거아님?");
                newTodoText.text(newText);
                $(this).replaceWith(newTodoText); // input 요소를 새로운 .todo-text 요소로 교체
                ajax_todo_add_id_append(todo_item); // ajax_로 새롭게 만들어진 todo_id를 넣어야함
                todo_list_line_up(todo_list);
            }
            // 새로 고친 데이터가 ''이 아니라면 데이터 저장
            else {
                newTodoText.text(newText);
                $(this).replaceWith(newTodoText); // input 요소를 새로운 .todo-text 요소로 교체
                todo_list_line_up(todo_list);
                // ajax 코드 필요함 => 투두 생성에 필요한_ (email, 날짜, 목표_이름)
            }

        // ajax 코드 필요 => 데이터 생성시 해당 

        });

        // input 요소에서 엔터 키가 눌리면 변경된 내용 저장
        inputElement.on('keypress', function (e) {
            if (e.which === 13) { // 엔터 키 코드는 13입니다.
                $(this).trigger('blur'); // blur 이벤트를 발생시켜 변경된 내용 저장
            }
        });
    }

    //              function: 투두_리스트의 완료, 미완료, 루틴 순으로 정렬하는 함수             //
    function todo_list_line_up(todo_list) {
        let finished = todo_list.find('.finished-todo');
        let current = todo_list.find('.current-todo');
        let coming = todo_list.find('.coming-todo');

        // Clear the current list
        todo_list.empty();

        // Append sorted items
        todo_list.append(finished);
        todo_list.append(current);
        todo_list.append(coming);
    }

    //              function: 투두_아이템의 체크박스 클릭시 완료, 미완료 상태 변환             //
    function todo_checkbox_change(todo_checkbox) {

        // 체크박스를 기준으로 해당 투두_아이팀을 가져온다.
        let todo_list = $(todo_checkbox).closest('.todo-list');
        let todo_item = $(todo_checkbox).closest('.todo-item');
        // 해당 투두_아이템이 투린_투두가 아님을 확인한다.
        let not_routine = todo_item.hasClass('coming-todo');
        !not_routine && todo_item.toggleClass('current-todo finished-todo')
        !not_routine && $(todo_checkbox).toggleClass('empty-black-box blue-check-box op-6')
        todo_list_line_up(todo_list);
    }

    //              function: 투두_아이템 드래그시 이동 할 수 있게함             //
    function move_todo_item() {
        // jQuery UI의 sortable 함수를 사용하여 todo-item 요소를 드래그 앤 드롭으로 순서 변경 가능하게 설정
        $(".todo-list").sortable({
            axis: "y", // Y축으로만 이동 가능하게 설정
            connectWith: ".todo-list", // todo-list 간 연결 설정
            placeholder: "sortable-placeholder", // 드래그 중인 요소의 자리 표시자 스타일 설정
            helper: "origin",
            cancel: ".coming-todo", // .coming-todo 클래스를 가진 요소는 드래그되지 않도록 설정
            update: function (event, ui) {
                // 요소의 순서가 변경될 때마다 호출되는 함수
                $(".todo-list").each(function () {
                    todo_list_line_up($(this));
                });
            },
            stop: function (event, ui) {
                // 드래그가 끝난 후 드래그된 요소를 jQuery 셀렉터로 받기
                var dragged_todo_item = ui.item; // 드래그된 요소를 jQuery 객체로 받음
                // 드래그된 요소에 대해 추가 작업을 수행할 수 있음
                var dragged_todo_title_name = $(dragged_todo_item).closest('.todo-box').find('.title-name').text();
                var dragged_todo_item_id = $(dragged_todo_item).find(`[name="todo-id"]`).val();
                todo_title_change(dragged_todo_item_id);
                selected_todo_info_reset()
            }
        }).disableSelection(); // 드래그 앤 드롭을 활성화
    }
    //              function: 투두_아이템 드래그시 이동 이후 목표_타이들을 변경한다.            //
    function todo_title_change(dragged_todo_item_id) {
        // ajax 코드 필요함 => 드래그 당한 요소의 타이틀 값을 찾아서 ajax로 데이터가 수정되어야함
    }
    //                  function:  투두_(+) 버튼 클릭시 투두_아이템_추가                //
    function start_todo_item_add(add_badge) {



        let todo_list = $(add_badge).parent().next();
        // `current_todo`의 HTML 내용
        let current_todo = `
            <div class="current-todo todo-item">
                <div class="todo-bundle">
                    <div class="todo-check-box empty-black-box medium-icon icon-22 op-6"></div>
                    <div class="todo-detail">
                        <div class="todo-text"></div>
                        <div class="todo-alarm">
                        </div>
                    </div>
                </div>
                <div class="todo-modal-button">
                    <div class="black-width-menu icon-22 op-4 sc-7"></div>
                </div>
                <input type="hidden" name="todo_memo_data" value="" />
                <input type="hidden" name="todo-id" value="4">
            </div>`;
        // `current_todo`를 HTML로 변환하여 `divElement`에 추가
        let divElement = $(current_todo);
        todo_list.append(divElement);

        divElement.find('.todo-text').dblclick()
    }






    //                                                                              function:  투두_아이템 모달 관련 함수                                                                          //

    //                  function:  투두_아이템 모달창 여는 함수                //
    function start_todo_item_modal(todo) {
        // 선택 투두의 id값, 텍스트를 저장하고 투두_아이템_모달의 타이틀로 해당 투두의 텍스트를 넣음
        selected_todo_id = $(todo).parent().find('[name="todo-id"]').val();
        selected_todo_info(selected_todo_id);
        $('.todo-item-name').text(selected_todo_content_text);
        show_menu_icon(todo)
        show(black_modal);
        move_up(todo_item_modal);
    }
    //              function: 아이템 모달에서 수정 버튼 클릭시 해당 투두를 더블클릭으로 수정 진행               //
    function item_modal_edit_menu_click() {
        $(`[name="todo-id"][value="${selected_todo_id}"]`).parent().find('.todo-text').dblclick();
        selected_todo_id = null;
    }
    //                  function:  투두_삭제_모달창 여는 함수                //
    function start_todo_item_delete_modal() {
        move_down(todo_item_modal)
        setTimeout(show, 300, todo_delete_modal)
    }
    //                  function:  투두_메모_모달창 여는 함수                //
    function start_todo_memo_modal() {
        move_down(todo_item_modal)
        start_memo_content_inner()
        setTimeout(move_up, 300, todo_memo_modal)
    }
    //                  function:  투두_알람_모달창 여는 함수                //
    function start_todo_alarm_modal() {
        move_down(todo_item_modal)
        setTimeout(move_up, 300, todo_alarm_modal)

    }
    //                  function: 투두_이미지_버튼에 대한 반응 함수                //
    function start_todo_image_modal() {
        move_down(todo_item_modal)
        hidden(black_modal)
    }
    //                  function:  투두_오늘 또 하기_버튼에 대한 반응 함수                //
    function start_todo_today_again_modal() {
        move_down(todo_item_modal)
        hidden(black_modal)
    }
    //                  function:  투두_내일 또 하기_버튼에 대한 반응 함수                //
    function start_todo_tomorrow_again_modal() {
        move_down(todo_item_modal)
        hidden(black_modal)
    }
    //                  function:  투두_다른날 또 하기_버튼에 대한 반응 함수                //
    function start_todo_anotherDay_again_modal(menu_name) {
        move_down(todo_item_modal)
        fill_calendar(year, month, menu_name)
        setTimeout(move_up, 300, todo_calendar_modal)
    }
    //                  function:  투두_캘린더_모달창 여는 함수                //
    function start_todo_anotherDay_move_modal(menu_name) {
        move_down(todo_item_modal)
        fill_calendar(year, month, menu_name)
        setTimeout(move_up, 300, todo_calendar_modal)
    }
    //                  function:  투두_오늘로 옮기기                //
    function start_todo_today_move_modal() {
        hidden(black_modal)
        move_down(todo_item_modal)
    }
    //                  function:  투두_내일로 옮기기                //
    function start_todo_tomorrow_move_modal() {
        hidden(black_modal)
        move_down(todo_item_modal)
    }























    //                                                                              function:  종합_투두_모달 관련 함수                                                                          //

    //              function: 종합 투두_모달 창 실행             //
    function start_total_todo_modal() {
        show(black_modal);
        show_total_menu_icon();
        move_up(total_todo_modal);
    }
    //              function: 종합 투두에서 메뉴 선택시 selected 적용             //
    function blue_radio_select(todo_item_menu) {
        $('.total-todo-menu').removeClass('selected');
        $(todo_item_menu).addClass('selected');
        $(menu_item).each(function (index, menu) { // 절대 index 지우지 말것!

            // 클릭된 요소의 두 번째 자식으로 존재하는 라디오 아이콘 변경
            var radio_button = $(menu).children().eq(1);

            // 해당 메뉴가 selected를 가지고 있는 경우 해당 아이콘을 부여
            if ($(menu).hasClass('selected')) {
                radio_button.removeClass(unselected_icon).addClass(selected_icon);
            } else {
                radio_button.removeClass(selected_icon).addClass(unselected_icon);
            }
        });
    }
    //              function: 종합 모달의 메뉴중에서 selected된 메뉴의 함수를 실행시킴             //
    function total_selected_menu() {
        var menu_item_list = ['total-todo-tomorrow-move', 'total-todo-anotherDay-move', 'total-todo-current-delete', 'total-todo-all-copy', 'total-todo-all-delete'];
        var menu_item_box = '.total-todo-items';
        let selectedChild = $(menu_item_box).children('.selected');

        menu_item_list.forEach(menu_item => {
            selectedChild.hasClass(menu_item) && menu_item === 'total-todo-tomorrow-move' && start_total_todo_tomorrow_move(selectedChild);
            selectedChild.hasClass(menu_item) && menu_item === 'total-todo-anotherDay-move' && start_total_todo_anotherDay_move(selectedChild);
            selectedChild.hasClass(menu_item) && menu_item === 'total-todo-current-delete' && start_total_todo_current_delete_modal(selectedChild);
            selectedChild.hasClass(menu_item) && menu_item === 'total-todo-all-delete' && start_total_todo_all_delete_modal(selectedChild);
            selectedChild.hasClass(menu_item) && menu_item === 'total-todo-all-copy' && start_total_todo_all_copy_modal(selectedChild);
        });
    }
    //              function: 미완료 투두 내일로 미루기             //
    function start_total_todo_tomorrow_move() {
        hidden(black_modal);
        move_down(total_todo_modal);
        // 아직 데이터 처리 함수 안넣음
        // 데이터 전송 이후 간단한 메세지 화면 구현
    }
    //              function: 미완료 투두 다른날로 바꾸기             //
    function start_total_todo_anotherDay_move(total_menu) {
        move_down(total_todo_modal);
        // 달력을 채우는 함수
        fill_calendar(year, month, total_menu)
        setTimeout(move_up, 300, todo_calendar_modal)
        // 아직 데이터 처리 함수 안넣음
    }
    //              function: 미완료 투두 삭제하기             //
    function start_total_todo_current_delete_modal() {
        move_down(total_todo_modal);
        setTimeout(show, 300, todo_delete_modal)
        // 아직 데이터 처리 함수 안넣음
    }
    //              function: 모든 투두 다른날로 복사 하기             //
    function start_total_todo_all_copy_modal(total_menu) {
        move_down(total_todo_modal);
        fill_calendar(year, month, total_menu)
        setTimeout(move_up, 300, todo_calendar_modal)
        // 아직 데이터 처리 함수 안넣음
    }
    //              function: 모든 투두 삭제하기             //
    function start_total_todo_all_delete_modal() {
        move_down(total_todo_modal);
        setTimeout(show, 300, todo_delete_modal)
        // 아직 데이터 처리 함수 안넣음
    }


























    //                                                                              function:  메모_모달 관련 함수                                                                          //

    //              function: 투두 메모_textarea안에 내용 넣기             //
    function start_memo_content_inner() {
        todo_memo_textarea.val(selected_todo_memo_data)
    }


























    //                                                                              function:  캘린더_모달 관련 함수                                                                          //

    //              function: 캘랜더 모달에 선택된 월의 정보를 가져오는 함수              //
    function getMonthInfo(year, month) {
        // 월의 첫 번째 날의 요일을 구합니다 (0: 일요일, 1: 월요일, ..., 6: 토요일)
        let firstDayOfWeek = new Date(year, month - 1, 1).getDay();

        // 월의 마지막 날짜를 구합니다
        let lastDayOfMonth = new Date(year, month, 0).getDate();

        // 오늘 날짜를 가져옵니다
        let now = new Date();
        let today = now.getDate();

        // 오늘 날짜가 같은 년도와 같은 달인 경우만 today 변수에 오늘 날짜를 할당합니다
        if (now.getFullYear() === year && now.getMonth() + 1 === month) {
            today = now.getDate();
        } else {
            today = null; // 같은 달이 아니면 null이 될 수 있도록 처리
        }

        let futur_month_fact = now.getMonth() + 1 < month
        let current_month_fact = now.getMonth() + 1 === month
        let futur_year_fact = now.getFullYear() <= year
        let current_year_fact = now.getFullYear() === year

        return {
            firstDayOfWeek: firstDayOfWeek,
            lastDayOfMonth: lastDayOfMonth,
            futur_year_fact: futur_year_fact,
            futur_month_fact: futur_month_fact,
            current_month_fact: current_month_fact,
            current_year_fact: current_year_fact,
            today: today,
            getSundaysOfMonth: function () {
                let sundays = [];
                let date = new Date(year, month - 1, 1); // 주어진 월의 첫째 날부터 시작

                // 첫 번째 일요일을 찾기 위해 요일이 일요일이 될 때까지 이동
                while (date.getDay() !== 0) {
                    date.setDate(date.getDate() + 1);
                }

                // 일요일을 찾았으므로 7일씩 더해가면서 해당 월의 모든 일요일을 찾음
                while (date.getMonth() === month - 1) {
                    sundays.push(date.getDate());
                    date.setDate(date.getDate() + 7);
                }

                return sundays;
            }
        };
    }
    //              function: 캘랜더 모달에 필요한 데이터를 주입함              //
    function fill_calendar(year, month, menu_name) {
        //              달력 정보에서 데이터 출력                //
        var monthInfo = getMonthInfo(year, month);
        var futur_year_fact = monthInfo.futur_year_fact;
        var futur_month_fact = monthInfo.futur_month_fact;
        var current_year_fact = monthInfo.current_year_fact;
        var current_month_fact = monthInfo.current_month_fact;
        var empty_count = monthInfo.firstDayOfWeek;
        var month_last_day = monthInfo.lastDayOfMonth
        var sun_list = sundays = monthInfo.getSundaysOfMonth();
        var today = monthInfo.today;

        var title = $(menu_name).text();
        console.log(title);
        if (title) {
            $(calendar_title).text(title)
        }
        // 달력 상단에 년도와 월 텍스트
        $('.selected-date').text(`${year}년 ${month}월`)

        // 첫째주에 필요한 공백 채워주는 코드
        for (let i = 0; i < empty_count; i++) {
            let divElement = $('<div>').addClass('empty')
            todo_calendar_days.append(divElement);
        }

        // 첫날부터 마지막날까지 날짜 넣어주는 코드
        for (let i = 1; i <= month_last_day; i++) {
            // div 요소를 생성하고 클래스를 추가합니다
            let divElement = $('<div>').addClass('todo-date-item').text(i);

            // 일요일인 경우 'sun' 클래스를 추가합니다
            if (sun_list.includes(i)) {
                divElement.addClass('sun');
            }

            // 오늘 날짜의 데이터인 경우 'today-tema' 클래스를 추가합니다
            if (today === i) {
                divElement.addClass('today-tema');
            }

            // 선택된 특정 날짜의 데이터에 따라 'selected-day-tema' 클래스를 추가합니다
            if (current_year_fact && current_month_fact) {
                if (day === i) {
                    divElement.addClass('selected-day-tema');
                }
            } else if (futur_year_fact && futur_month_fact) {
                if (i === 1) {
                    divElement.addClass('selected-day-tema');
                }
            } else {
                if (i === month_last_day) {
                    divElement.addClass('selected-day-tema');
                }
            }

            // 해당 날짜 아이템에게 클릭 이변트를 넣어준다.
            divElement.on('click', function () {
                $('.todo-date-item').removeClass('selected-day-tema');
                $(this).addClass('selected-day-tema');
            });

            todo_calendar_days.append(divElement);
        }
    }
    //              function: 캘린더의 내용을 지워주는 함수             //
    function clean_calendar_modal() {
        $('.todo-calendar-days').html('');
    }
    //              function: 타켓 날짜 데이터를 기존 날짜 데이터로 초기화 함수                //
    function target_date_reset() {
        target_year = year
        target_month = month;
        target_day = day;
        target_date = time_test;
    }
    //              function: 캘랜더 모달 pre 클릭시 날짜 데이터 변경 함수              //
    function modal_calendar_pre_month() {
        target_month -= 1;
        if (target_month == 0) {
            target_year -= 1;
            target_month = 12;
        }
        clean_calendar_modal();
        fill_calendar(target_year, target_month)
    }
    //              function: 캘랜더 모달 next 클릭시 날짜 데이터 변경 함수              //
    function modal_calendar_next_month() {
        target_month += 1;
        if (target_month % 13 == 0) {
            target_year += 1;
            target_month = 1;
        }
        clean_calendar_modal();
        fill_calendar(target_year, target_month)
    }
    //              function: 캘랜더 모달 확인버튼 클릭시 날짜_데이터 출력 함수              //
    function calendar_date_data_send() {
        target_day = $('.todo-date-item.selected-day-tema').text();
        target_date = `${target_year}-${target_month}-${target_day}`
        // 타켓 날짜 데이터를 출력하게 만들어 놓음
        console.log(`선택일자: ${target_day}`);
        console.log(`선택날짜: ${target_date}`);
    }





















    //                                                                              function:  알람_모달 관련 함수                                                                          //

    //              function: 알람 데이터를 전송하는 코드              //
    function start_todo_alarm_data_send() {
        let alarm_period = $('.selected-period').text().trim();
        let apm;
        alarm_period == '오전' ? apm = 'AM' : apm = 'PM';
        let alarm_hour = $('.selected-hour').text().trim();
        let alarm_minute = $('.selected-minute').text().trim();
        var alarm_time_text = `${apm}${alarm_hour}:${alarm_minute}`;

        $(selected_todo_alarm).html('');
        let alarm_text = $('<div>').addClass('alarm-text').text(alarm_time_text)

        let alarm_icon = `<div class="black-clock icon-8 op-4"></div>`
        $(selected_todo_alarm).append(alarm_icon);
        $(selected_todo_alarm).append(alarm_text);
    }
    function start_todo_alarm_data_delete() {
        $(selected_todo_alarm).html('');
    }

    //              function: 선택된 투두의 알람데이터가 존재하지는지 확인하는 코드              //
    function todo_alarm_fact() {
        // 해당 요소에 알람 데이터가 있는 경우
        if (selected_todo_alarm.children().length > 0) {
            $('.todo-alarm-delete-button').css('display', 'flex')
        } else {
            $('.todo-alarm-delete-button').css('display', 'none')
        }
    }




























    //                                                                              function:  삭제_모달 관련 함수                                                                          //

    //              function: 삭제 모달에서 삭제버튼 클릭시 발생하는 함수               //
    function start_selected_todo_delete() {
        // 선택되어진 div를 삭제함
        $(selected_todo_item).remove()
    }



































    //                                                                              function:  도넛_캘린더_모달 관련 함수                                                                          //

    //              function: 캘런더 도넛차트 클릭시 날짜 데이터 변경              //
    function calendar_donut_date_move(docut) {
        var todo_date = $(docut).find('.todo-date-data').val();
        time_reset(todo_date)
        // 이후에 투두 리스트들이 변경되는 ajax 코드 작성할것
    }

























    //                                                                              ajax:  데이터 추가하는 코드                                                                        //
    function ajax_todo_add_id_append(todo_item){
        $(todo_item).find(`[name="todo-id"]`).val(12);
    }




































    //                                                                              event handler:  일반 클릭 이벤트                                                                          //

    //              event handler: 상단 추가 메뉴 드롭다운                //
    $('.feed-more').on('click', function () {
        menu_dropDown(this);
    });
    //              event handler: 도넛 날짜 클릭시 날짜 데이터 변경 함수             //
    $('.date-item').on('click', function () {
        calendar_donut_date_move(this);
    });

    //              event handler: 검은 모달 바깥쪽 클릭시 모든 모달 닫힘               //
    $('.feed-modal').on('click', function () {
        stop_click() && modal_end(this);
    });


    //                                                                              event handler:  투두 편집 관련 이벤트                                                                          //

    //              event handler: 투두를 토글로 열고 닫을 수 있다.               //
    $('.todo-toggle').on('click', function () {
        stop_click() && todoListToggle(this);
    });
    //              event handler: 투두의 내용물 더블 클릭으로 수정할 수 있다.               //
    $(document).on('dblclick', '.todo-text', function () {
        todoEdit_dbClick(this)
        // && ajax코드 필요;
    });
    //              event handler: 투두 타이틀 뱃지 클릭시 새로운 투두 추가                //
    $('.title-badge').on('click', function () {
        start_todo_item_add(this);
    });
    //              event handler: 투두 체크박스 클릭시 완료, 미완료를 바꿔줌                //
    $(document).on('click', '.todo-check-box', function () {
        todo_checkbox_change(this);
        // ajax 필요 해당투두에 대한 상태를 저장해야함
    });
    $(document).ready(function () {
        move_todo_item()
    });

    //                                                                              event handler:  투두 아이템 모달 관련 이벤트                                                                          //

    //              event handler: 투두-아이템-모달창을 열 수 있다.               //
    $(document).on('click', '.todo-modal-button', function () {
        stop_click() && start_todo_item_modal(this);
    });
    //              event handler: 수정 버튼 클릭시 해당 투두의 텍스트 더블 클릭             //
    $('.todo-item-edit-button').on('click', function () {
        modal_end(this);
        item_modal_edit_menu_click()
    });
    //              event handler: 삭제 버튼 클릭시 삭제 모달 활성화             //
    $('.todo-item-delete-button').on('click', function () {
        start_todo_item_delete_modal(this);
    });
    //              event handler: 메모 버튼 클릭시 모달 활성화               //
    $('.todo-item-memo').on('click', function () {
        start_todo_memo_modal(this);
    });
    //              event handler: 알람 버튼 클릭시 모달 활성화              //
    $('.todo-item-alarm').on('click', function () {
        start_todo_alarm_modal(this);
        todo_alarm_fact()
    });
    //              event handler: 이미지 버튼 클릭시 모달 활성화              //
    $('.todo-item-image').on('click', function () {
        start_todo_image_modal(this);
    });
    //              event handler: 오늘 또 하기 버튼 클릭시 모달 활성화              //
    $('.todo-item-image').on('click', function () {
        start_todo_today_again_modal(this);
    });
    //              event handler: 내일 또 하기 버튼 클릭시 모달 활성화              //
    $('.todo-item-tomorrow-again').on('click', function () {
        start_todo_tomorrow_again_modal(this);
    });
    //              event handler: 다른 날 또 버튼 클릭시 모달 활성화              //
    $('.todo-item-anotherDay-again').on('click', function () {
        start_todo_anotherDay_again_modal(this);
    });
    //              event handler: 날짜 바꾸기 버튼 클릭시 모달 활성화              //
    $('.todo-item-day-change').on('click', function () {
        start_todo_anotherDay_move_modal(this);
    });
    //              event handler: 오늘 하기 버튼 클릭시 모달 활성화              //
    $('.todo-item-today-move').on('click', function () {
        start_todo_today_move_modal(this);
    });
    //              event handler: 내일 하기 버튼 클릭시 모달 활성화              //
    $('.todo-item-tomorrow-move').on('click', function () {
        start_todo_tomorrow_move_modal(this);
    });


    //                                                                              event handler:  종합 투두 모달 관련 이벤트                                                                          //

    //              event handler: 하단 (...)클릭시 종합_투두_모달 활성화             //
    $('.total-todo-more-buttom').on('click', function () {
        stop_click() && start_total_todo_modal(this);
    });
    //              event handler: 종합 모달_라디오버튼(전용)              //
    $('.total-todo-menu').on('click', function () {
        blue_radio_select(this)
    });
    //              event handler: 종합 메뉴 선택 이후 Ok버튼 클릭시             //
    $('.total-todo-selected-ok').on('click', function () {
        total_selected_menu(this);
    });
    //              event handler: 종합 모달 취소             //
    $('.total-todo-selected-cancel').on('click', function () {
        modal_end(this);
    });

    //                                                                              event handler:  캘린더 모달 관련 이벤트                                                                          //

    //              event handler: 달력 모달에서 이전 월일 출력 코드             //
    $(pre_month).on('click', function () {
        modal_calendar_pre_month(this);
    });
    //              event handler: 달력 모달에서 다음 월일 출력 코드             //
    $(next_month).on('click', function () {
        modal_calendar_next_month(this);
    });
    //              event handler: 달력 모달에서 확인 버튼 클릭시 날짜 데이터 반환             //
    $('.todo-calendar-ok-button').on('click', function () {
        calendar_date_data_send() // 아직은 날짜 데이터를 콘솔 로그만 찍음
        target_date_reset();
        modal_end(this);
        // 데이터 전송 관련 코드 작성 아직 안함
    });




    //                                                                              event handler:  알람 모달 관련 이벤트                                                                          //

    //              event handler: 알람 오전/오후 고르는 코드             //
    $(alarm_period_button).on('click', function () {
        $(alarm_period_button).removeClass('selected-period');
        $(this).addClass('selected-period');
    });

    //              event handler: 알람 "시"를 고르는 코드             //
    $(alarm_hour_button).on('click', function () {
        $(alarm_hour_button).removeClass('selected-hour');
        $(this).addClass('selected-hour');
    });

    //              event handler: 알람 "분"를 고르는 코드             //
    $(alarm_minute_button).on('click', function () {
        $(alarm_minute_button).removeClass('selected-minute');
        $(this).addClass('selected-minute');
    });

    //              event handler: 알람 모달 확인 버튼 클릭시 발생하는 함수             //
    $(todo_alarm_ok_button).on('click', function () {
        modal_end(this);
        start_todo_alarm_data_send(this) // 이름만 지어놓음
    });

    //              event handler: 알람 모달 삭제 버튼 클릭시 발생하는 코드             //

    $('.todo-alarm-delete-button').on('click', function () {
        modal_end(this);
        start_todo_alarm_data_delete();
    });




    //                                                                              event handler:  삭제 모달 관련 이벤트                                                                          //

    //              event handler: 삭제 모달에서 취소 버튼 클릭             //
    $('.todo-delete-cancel').on('click', function () {
        modal_end(this);
    });
    //              event handler: 삭제 모달에서 확인 버튼 클릭             //
    $('.todo-delete-ok').on('click', function () {
        start_selected_todo_delete()
        modal_end(this);
        // ajax 코드 필요 => selected_todo_id로 데이터를 찾아서 값을 변경해줘야함
    });















});






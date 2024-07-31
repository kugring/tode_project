$(function () {


    //              variable: 목표 관련 데이터를 담는 변수               //
    var goal_id;
    var goal_color_id;
    var goal_user_email;
    var goal_title_text;
    var goal_open_setting;


    //              variable: 목표 아이템 변수              //
    var goal_item = $('.goal-item')


    //              variable: 목표 관련 모달 변수들             //
    var goal_black_modal = $('.goal-black-modal')
    var open_setting_modal = $('.open-setting-modal')
    var color_modal = $('.color-modal')
    var finish_modal = $('.finish-modal')
    var goal_finish_message_modal = $('.goal-finish-message-modal')
    var goal_delete_modal = $('.goal-delete-modal')
    var goal_plan_complete = $('.goal-plan-complete-btn');



    //              variable: 목표 관련 모달 변수들             //
    var target_open_setting_text;
    var target_color_id;


    //              variable: 라디오 버튼 관련 변수 모음              //
    var open_setting_menu = $('.open-setting-menu');
    var finish_menu = $('.finish-menu');
    var selected_icon = 'blue-radio icon-22';
    var unselected_icon = 'empty-black-circle icon-24 op-4';


    //              variable: 연타 글릭 방지 코드               //
    let isClickAllowed = true; // 플래그 변수 초기화


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

    //             function : 모든 모달창 종료              //
    function end_total_modal() {
        hidden(goal_black_modal);
        hidden(goal_finish_message_modal);
        hidden(goal_delete_modal);
        move_down(finish_modal);
        move_down(color_modal);
        move_down(open_setting_modal);
    }

    //             function : 모달 출현 연타 클릭 방지를 위한 함수              //
    function stop_click() {
        if (!isClickAllowed) return false;
        isClickAllowed = false; // 클릭 비활성화
        // 일정 시간 후 클릭 재활성화 (여기서는 1초 후)
        setTimeout(function () {
            isClickAllowed = true;
        }, 800);

        return true;
    }


    //             function : 공개 설정에 대한 모달 출현 함수              //
    function start_goal_open_setting_modal() {
        show(goal_black_modal);
        move_up(open_setting_modal);
    }

    //             function : 목표의 배경 컬러를 모달 출현 함수              //
    function start_goal_color_modal() {
        show(goal_black_modal);
        move_up(color_modal);
    }

    //             function : 목표의 종료에 관련한 모달 출현 함수             //
    function start_goal_finish_modal() {
        show(goal_black_modal);
        move_up(finish_modal);
    }

    //             function : 목표의 종료에 대한 메세지_모달 출현 함수             //
    function start_goal_finsh_message_modal() {
        move_down(finish_modal);
        setTimeout(show, 300, goal_finish_message_modal)
    }

    //             function : 목표의 삭제에 대한 모달 출현 함수             //
    function start_goal_delete_modal() {
        show(goal_black_modal);
        setTimeout(show, 300, goal_delete_modal)
    }

    //              function: 라디오 선택 모달에서 메뉴 선택시 selected 적용             //
    function blue_radio_select(menu_item, menu_class) {
        $(menu_class).removeClass('selected');
        $(menu_item).addClass('selected');
        $(menu_class).each(function (index, menu) { // 절대 index 지우지 말것!

            // 클릭된 요소의 두 번째 자식으로 존재하는 라디오 아이콘 변경
            var radio_button = $(menu).children().eq(1);
            console.log(radio_button);

            // 해당 메뉴가 selected를 가지고 있는 경우 해당 아이콘을 부여
            if ($(menu).hasClass('selected')) {
                radio_button.removeClass(unselected_icon).addClass(selected_icon);
            } else {
                radio_button.removeClass(selected_icon).addClass(unselected_icon);
            }
        });
    }


    //                                                                              function:  페이지 이동에 관한 함수 모음 구역                                                                           //


    //              function: 목표를 추가 & 수정 하는 페이지로 이동하는 함수             //
    function goal_plan_page_move() {
        $('.goal-title-page').css('display', 'none')
        $('.goal-plan-page').css('display', 'flex')
    }

    //              function: 목표 리스트 페이지로 이동하는 함수             //
    function goal_list_page_move() {
        $('.goal-title-page').css('display', 'flex')
        $('.goal-plan-page').css('display', 'none')
    }

    //              function: 목표 아이템의 데이터를 주입하는 코드             //
    function set_selected_goal_data(goal_badge) {
        goal_id = $(goal_badge).find('input[name = "todo-title-id"]').val();
        goal_color_id = $(goal_badge).find('input[name = "color-id"]').val();
        goal_color_code = $(goal_badge).css('color');
        goal_user_email = $(goal_badge).find('input[name = "email"]').val();
        goal_title_text = $(goal_badge).find('input[name = "todo-title"]').val();
        goal_open_setting = $(goal_badge).find('input[name = "title-todo-open"]').val();
    }

    //              function: 목표 아이템의 데이터를 초기화하는 코드             //
    function reset_selected_goal_data(goal_badge) {
        goal_id = null;
        goal_color_id = null;
        goal_user_email = null;
        goal_title_text = null;
        goal_open_setting = null;

        target_open_setting_text = null;
        target_color_id = null;

        // 목표 플랜 페이지의 인풋 칸을 비워준다.
        $('.goal-text-input').val('')
    }


    //              function: 목표 (+)버튼 클릭시 발생할 함수            //
    function create_goal_plan_element() {
        // 목표의 제목을 넣어준다.
        $('.goal-text-input').val('');

        // 색을 모달 창에서 선택하게 하는 코드 작성하면됨
        $('.color-items').find(`input[name="color-id"][value="1"]`).click();

        // 목표의 공개 설정의 값을 넣어준다.
        plan_page_open_setting_change('전체 공개');
    }

    //              function: 목표 아이템의 선택시 플랜 페이지에 데이터를 기입해주는 코드            //
    function change_goal_plan_element() {
        // 목표의 제목을 넣어준다.
        $('.goal-text-input').val(goal_title_text);

        // 색을 모달 창에서 선택하게 하는 코드 작성하면됨
        $('.color-items').find(`input[name="color-id"][value="${goal_color_id}"]`).click();

        console.log(goal_open_setting);
        // 목표의 공개 설정의 값을 넣어준다.
        plan_page_open_setting_change(goal_open_setting);
    }


    //                                                                              function:  공개설정 모달 관련 함수 모음 구역                                                                           //

    //              function: 공개설정에서 확인 버튼 클릭시 selected 되어진 메뉴값을 화면에 구현해줌             //
    function set_goal_open_setting_data() {
        let selected_open_setting_menu_text = $('.open-setting-items').find('.selected').find('.text').text();
        console.log(selected_open_setting_menu_text);
        plan_page_open_setting_change(selected_open_setting_menu_text)
    }

    //              function: 공개설정에서 확인 버튼 클릭시 selected 되어진 메뉴값을 화면에 구현해줌             //
    function plan_page_open_setting_change(open_setting_menu) {
        let setting_text = '';
        let setting_icon = '';

        if (open_setting_menu == '전체 공개') {
            setting_text = '전체 공개';
            setting_icon = '<div class="black-earth icon-16 op-6"></div>';
        } else if (open_setting_menu == '팔로워 공개') {
            setting_text = '팔로워 공개';
            setting_icon = '<div class="black-group icon-16 op-6"></div>';
        } else if (open_setting_menu == '나만보기') {
            setting_text = '나만보기';
            setting_icon = '<div class="black-lock icon-16 op-6"></div>';
        }

        $('.goal-plan-open-setting-text').text(setting_text);
        $('.goal-plan-open-setting-icon').html(setting_icon);
        // 플랜중인 목표의 공개설정 값을 담음
        target_open_setting_text = setting_text;
    }


    //                                                                              function:  색상선택 모달 관련 함수 모음 구역                                                                           //

    //              function: 선택되어진 컬러의 id값을 출력하는 함수             //
    function set_color_id(color_item) {
        target_color_id = $(color_item).find('input[name="color-id"]').val();
    }

    //              function: 선택된 컬러로 색상 변경해주는 함수            //
    function start_color_change(color_item) {
        let selected_background_color = $(color_item).css('background-color');
        $('.select-color').css('background-color', selected_background_color)
        $('.goal-divide-line').css('border-top', `3px solid ${selected_background_color}`)
        $('.goal-text-input').css('color', selected_background_color)
    }

    //              function: 선택된 컬러의 seleted를 토글하는 함수            //
    function toggle_seletecd_color_class(color_item) {
        $('.color-item').removeClass('color-selected')
        $(color_item).addClass('color-selected');
    }


    //                                                                              event handler:  화면 변경에 대한 이벤트                                                                          //

    //              event handler: 목표 리스트의 아이템을 클릭 이벤트              //
    $('.goal-item').on('click', function () {
        goal_plan_page_move()
        set_selected_goal_data(this);
        // 해당 목표에 대한 정보를 가지고 이동해야함
        change_goal_plan_element(this)
    });
    //              event handler: 목표 리스트의 (+) 버튼 클릭 이벤트              //
    $('.goal-add-button').on('click', function () {
        create_goal_plan_element()
        goal_plan_page_move()
    });
    //              event handler: 목표 리스트의 아이템을 클릭 이벤트              //
    $('.goal-list-page-move').on('click', function () {
        goal_list_page_move()
        // 해당 목표에 대한 정보를 가지고 이동해야함
    });


    //                                                                              event handler:  모달창에 출현에 대한 이벤트                                                                          //

    //              event handler: 검은 화면 영역을 클릭시 모든 모달이 닫힘이벤트              //
    $('.goal-black-modal').on('click', function () {
        stop_click() && end_total_modal();
    });
    //              event handler: 목표 공개 설정에 대한 모달이 출현하는 이벤트              //
    $('.goal-plan-open-setting-modal-button').on('click', function () {
        stop_click() && start_goal_open_setting_modal();
    });
    //              event handler: 목표 배경 색깔 선택에 대한 모달이 출현하는 이벤트              //
    $('.goal-select-color-button').on('click', function () {
        stop_click() && start_goal_color_modal();
    });
    //              event handler: 목표 종료에 대한 모달이 출현하는 이벤트              //
    $('.goal-finish-modal-button').on('click', function () {
        stop_click() && start_goal_finish_modal();
    });
    //              event handler: 목표 종료 관련 메세지 모달 출현하는 이벤트              //
    $('.goal-finish-modal-ok-button').on('click', function () {
        stop_click() && start_goal_finsh_message_modal();
    });
    //              event handler: 목표 삭제 버튼 클릭 이벤트              //
    $('.goal-delete-modal-button').on('click', function () {
        stop_click() && start_goal_delete_modal();
    });


    //                                                                              event handler:  색상선택 모달 관한 이벤트                                                                          //
    $('.color-item').on('click', function () {
        set_color_id(this)
        start_color_change(this)
        toggle_seletecd_color_class(this);
        end_total_modal();
    });


    //                                                                              event handler:  목표_공개_설정 관한 이벤트                                                                          //

    //              event handler: 공개 설정 모달_라디오버튼(전용)              //
    $('.open-setting-menu').on('click', function () {
        blue_radio_select(this, open_setting_menu)
    });
    //              event handler: 공개 설정에 대한 확인 버튼 클릭시 이벤트              //
    $('.open-setting-select-ok-button').on('click', function () {
        set_goal_open_setting_data()
        end_total_modal();
    });


    //                                                                              event handler:  목표_삭제 관한 이벤트                                                                          //

    //              event handler: 목표 삭제 모달 확인 버튼 클릭 이벤트              //
    $('.goal-delete-ok').on('click', function () {
        stop_click() && end_total_modal();
    });
    //              event handler: 목표 삭제 모달 취소 버튼 클릭 이벤트              //
    $('.goal-delete-cancel').on('click', function () {
        stop_click() && end_total_modal();
    });


    //                                                                              event handler:  목표_종료 관한 이벤트                                                                          //

    //              event handler: 목표 종료 모달_라디오버튼(전용)              //
    $('.finish-menu').on('click', function () {
        blue_radio_select(this, finish_menu)
    });
    //              event handler: 목표 종료_메시지_모달 확인 버튼 클릭시 이벤트              //
    $('.goal-finish-message-cancel-button').on('click', function () {
        end_total_modal();
        // 선택되어진 메뉴에 대한 실행 함수필요
    });
    //              event handler: 목표 종료_메시지_모달 취소 버튼 클릭시 이벤트              //
    $('.goal-finish-message-ok-button').on('click', function () {
        end_total_modal();
    });

    $('.black-left-arrow').on('click', function () {
        window.location.href = "/todo/feed.do";
    });


    //우측 상단 완료 버튼 시 이벤트 적용(ajax로 controller에 데이터 전송)





    jQuery(document).ready(function (){

        $(".goal-plan-complete-btn").click(function(){


            $.ajax({

                type: 'post',

                url: "/todo/goal.do",

                async: true,

                data: {
                    "todoTitleId" : goal_color_id,
                    "goal_user_email" : goal_user_email,
                    "goal_title_text" : goal_title_text,
                    "goal_open_setting" : goal_open_setting
                },

                datatype: "JSON",

                success: function(result){

                    alert(result);



                },
                error: function (result) {
                    alert("ERROR!!!");
                }

            });

        })

    });




});
























































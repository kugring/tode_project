//             function : 모달 css 효과들에 대한 모음              //
import {futur_fact, today_fact} from "./timeSetting";

export function show(modal) {
    modal.css('display', 'flex');
    modal[0].offsetHeight;
    modal.css('opacity', '1');
}

export function hidden(modal) {
    modal.css('opacity', '0');
    setTimeout(() => {
        modal.css('display', 'none');
    }, 500);
}

export function move_up(modal) {
    show(modal)
    modal.css('transform', 'translateY(0)');
}

export function move_down(modal) {
    modal.css('transform', 'translateY(100%)');
    setTimeout(hidden, 300, modal);
}


//              function: 피드에서 모든 모달을 종료하고 값을을 초가화한다               //
export function modal_end() {
    setTimeout(hidden, 100, $('.feed-modal'))
    move_down($('.todo-item-modal'))
    move_down($('.todo-memo-modal'))
    move_down($('.todo-alarm-modal'))
    move_down($('.todo-calendar-modal'))
    move_down($('.total-todo-modal'));
    hidden($('.todo-delete-modal'));
    hidden_menu_icon()
    selected_todo_info_reset()

    clean_calendar_modal();
    $('.todo-memo-textarea').val(''); // value 값을 빈 문자열로 설정하여 지웁니다.
}


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

//              function: mdoal이 종료될때 모달 관련 아이콘을 다시 숨김             //
export function hidden_menu_icon() {
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
//              function: 투두_아이템_모달에서 아이콘을 보이게 해줌             //
export function show_menu_icon(todo) {
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
export function show_total_menu_icon() {
    var current_todo_fact = todo_container.find('.current-todo').length > 0;
    current_todo_fact && total_todo_tomorrow_move_icon.css('display', 'flex');
    current_todo_fact && total_todo_anotherDay_move_icon.css('display', 'flex');
    current_todo_fact && total_todo_current_delete.css('display', 'flex');
}
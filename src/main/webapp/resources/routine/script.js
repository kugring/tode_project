$(function () {
    var date_modal_button = $('.date-modal-button');
    var todo_alarm_modal_button = $('.todo-alarm-modal-button');
    var routine_delet_button = $('.routine-delete-button');
    var routine_delete_ok = $('.routine-delete-ok');
    var routine_delete_cancel = $('.routine-delete-cancel');
    var todo_alarm_ok_button = $('.todo-alarm-ok-button');
    var ok_box = $('.ok-box');


    // var followingButton = $('.following-button');
    // var followerList = $('.follower-list');
    //스위치 바꿀때



    var black_modal = $('.routine-black-modal');
    var date_modal = $('.date-modal');
    var todo_alarm_modal = $('.todo-alarm-modal');
    var routine_delete_modal = $('.routine-delete-modal');


    $(date_modal_button).on('click', function () {
        start_routine_date_modal();
    });

    $(todo_alarm_modal_button).on('click', function () {
        start_routine_todo_alarm_modal();
    });

    $(routine_delet_button).on('click', function () {
        start_routine_delete_modal();
    });



    $(routine_delete_ok).on('click', function () {
        modal_end();
    });
    $(routine_delete_cancel).on('click', function () {
        modal_end();
    });

    $(todo_alarm_ok_button).on('click', function () {
        modal_end();
    });

    $(ok_box).on('click', function () {
        modal_end();
    });


    $(document).ready(function() {
        $('#mySwitch').change(function() {
            if($(this).is(':checked')) {
                console.log('Switch is ON');
            } else {
                console.log('Switch is OFF');
            }
        });
    });




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

    function modal_end(modal) {
        setTimeout(hidden, 100, black_modal)
        move_down(date_modal)
        move_down(todo_alarm_modal)
        hidden(routine_delete_modal);
    }



    function start_routine_date_modal(){
        show(black_modal)
        move_up(date_modal)
    }


    function start_routine_todo_alarm_modal(){
        show(black_modal)
        move_up(todo_alarm_modal)
    }

    function start_routine_delete_modal(){
        show(black_modal)
        move_up(routine_delete_modal)
    }

    $(black_modal).on('click', function () {
        modal_end(this);
    });



});
































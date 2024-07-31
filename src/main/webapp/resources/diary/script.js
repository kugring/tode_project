$(function () {
    //          변수
    var diary_black_modal = $('.diary-black-modal')
    var open_setting_modal = $('.open-setting-modal')
    var calendar_modal = $('.calendar-modal')
    var colors_modal = $('.colors-modal')
    var emoji_modal = $('.emoji-modal')



    // 클릭 이벤트 등록하는 구간
    $('.select-open-setting-button').on('click', function () {
        start_open_setting_modal();
    });
    // 클릭 이벤트 등록하는 구간
    $('.select-emogi-button').on('click', function () {
        start_emogi_modal();
    });
    // 클릭 이벤트 등록하는 구간
    $('.select-color-button').on('click', function () {
        start_color_modal();
    });
    // 클릭 이벤트 등록하는 구간
    $('.select-calendar-button').on('click', function () {
        start_calendar_modal();
    });


    // 검은 화면 영역을 클릭시 모든 모달이 닫힘
    $('.diary-black-modal').on('click', function () {
        end_total_modal();
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


    function end_total_modal(){
        hidden(diary_black_modal);
        move_down(open_setting_modal);
        move_down(calendar_modal);
        move_down(colors_modal);
        move_down(emoji_modal);

    }

    function start_color_modal() {
        show(diary_black_modal);
        move_up(colors_modal);
    }
    function start_emogi_modal() {
        show(diary_black_modal);
        move_up(emoji_modal);
    }
    function start_open_setting_modal() {
        show(diary_black_modal);
        move_up(open_setting_modal);
    }
    function start_calendar_modal() {
        show(diary_black_modal);
        move_up(calendar_modal);
    }


    $('.black-left-arrow').on('click', function () {
        window.location.href = "/todo/feed.do";
    });

});


/*
function unmodalfn(){

    $('.diary-modal').on('click', function(){
        $('.diary-modal').css('display','none');
    });
}
*/
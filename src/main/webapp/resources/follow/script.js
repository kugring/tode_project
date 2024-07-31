$(function () {
    var title_follow_button = $('.follow-page-button')
    var followerButton = $('.follower-button');
    var followingButton = $('.following-button');
    var followerList = $('.follower-list');
    var followingList = $('.following-list');
    var follower_delete_modal_button = $('.follower-delete-modal-button')
    var unfollow_modal_button = $('.unfollow-modal-button')



    var black_modal = $('.follow-black-modal')
    var unfollow_modal= $('.unfollow-modal')
    var follower_delete_modal= $('.follower-delete-modal')




    // 상단 팔로워, 팔로잉 선택 이벤트
    $(title_follow_button).on('click', function () {
        follow_select();
    });
    // 상단 팔로워, 팔로잉 선택 이벤트
    $(follower_delete_modal_button).on('click', function () {
        start_follower_delete_modal();
    });
    $(unfollow_modal_button).on('click', function () {
        start_unfollow_modal();
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
        move_down(follower_delete_modal)
        move_down(unfollow_modal)
    }



    function follow_select() {
        // 초기 상태에서 팔로잉 리스트를 표시하고 팔로워 리스트를 숨깁니다.
        $(followerButton).toggleClass('selected');
        $(followingButton).toggleClass('selected');
        show_list();
    }

    function show_list(){
        var follower_select = $(followerButton).hasClass('selected');
        var following_select = $(followingButton).hasClass('selected')

        if (follower_select) {
            followerList.css('display', 'flex');
            followingList.css('display', 'none');
        }

        if (following_select) {
            followerList.css('display', 'none');
            followingList.css('display', 'flex');
        }

    }




    function start_follower_delete_modal(){
        show(black_modal)
        move_up(follower_delete_modal)
    }


    function start_unfollow_modal(){
        show(black_modal)
        move_up(unfollow_modal)
    }

    $(black_modal).on('click', function () {
        modal_end(this);
    });

    $('.black-left-arrow').on('click', function () {
        window.location.href = "/todo/feed.do";
    });


    jQuery(document).ready(function (){

        $(".follow-button").click(function(){

            $.ajax({

                type: 'post',

                url: "/todo/follow.do",

                async: true,

                data: {
                    year: '<%=year%>',
                    term: term
                },

                datatype: "JSON",

                success: function(result){

                    var data = JSON.parse(result);

                },
                error: function (result) {
                    console.log("ERROR!!!");
                }

            });

        })

    });

});
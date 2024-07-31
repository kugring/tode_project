
    export let year, month, day, today_fact, futur_fact, target_date;

    export function time_reset(time) {
        let date = new Date(time);

        year = date.getFullYear(); // 년도
        month = date.getMonth() + 1; // 월
        day = date.getDate(); // 날짜
        today_fact = isSameDay(date);
        futur_fact = isTodayOrFuture(date);
        target_date = date;
    }



    export function isSameDay(dateString) {
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


    export function isTodayOrFuture(dateString) {
        // 주어진 날짜 문자열을 Date 객체로 변환
        const givenDate = new Date(dateString);
        // 현재 날짜를 Date 객체로 가져오고 시간 정보를 00:00:00으로 설정
        const now = new Date();
        now.setHours(0, 0, 0, 0);
        // 주어진 날짜가 오늘 날짜와 같거나 이후인지를 비교
        return givenDate >= now;
    }




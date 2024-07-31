//              variable: 연타 글릭 방지 코드               //
export let isClickAllowed = true; // 플래그 변수 초기화


//              function: 특정 요소의 클릭을 0.8초 동안 연속 클릭을 방지한다.               //
export function stop_click() {
    if (!isClickAllowed) return false;
    isClickAllowed = false; // 클릭 비활성화
    // 일정 시간 후 클릭 재활성화 (여기서는 1초 후)
    setTimeout(function () {
        isClickAllowed = true;
    }, 800);
    return true;
}
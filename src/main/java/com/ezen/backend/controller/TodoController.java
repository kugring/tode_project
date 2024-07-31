package com.ezen.backend.controller;

import java.time.LocalDate;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.ezen.backend.Repository.*;
import com.ezen.backend.VO.*;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller

@RequestMapping("/todo")
public class TodoController {
    @Autowired
    UserRepository userRepository;

    @Autowired
    GoalRepository goalRepository;

    @Autowired
    FeedRepository feedRepository;

    @Autowired
    ServletContext servletContext;

    @Autowired
    FollowRepository followRepository;

    @Autowired
    DiaryRepository diaryRepository;

    @Autowired
    RoutineRepository routineRepository;


    @RequestMapping(value = "/feed.do", method = RequestMethod.GET)
    public String feed(
            Model model, FeedVO vo,
            @SessionAttribute(name = "user") UserVO user,
            @RequestParam(name = "email", required = false) String target_email
    ) {


        Calendar calendar = Calendar.getInstance();
        // 현재 연도와 월 가져오기
        int year = calendar.get(Calendar.YEAR);
        int month = calendar.get(Calendar.MONTH) + 1; // 0~11, 0이 1월

        // 이메일과 해당 월의 날짜별 완료된 투두 개수 조회
        List<Map<String, Object>> completedTodosPerDay = feedRepository.findCompletedTodosPerDay(user.getEmail(), year, month);
        model.addAttribute("todoCount", completedTodosPerDay);

        List<FeedVO> feedList = feedRepository.findByEmailAndToday(user.getEmail());
        model.addAttribute("feedvo", feedList);


        List<GoalVO> goalList = goalRepository.getList(user.getEmail());
        model.addAttribute("goalvo", goalList);

        // 해당 달의 날짜 데이터의 정보
        model.addAttribute("dateInfo", donutCalendarInfo());

        // 팔로우 데이터 가져오기
        List<FollowVO> followList = followRepository.getFollowing(user.getEmail());
        model.addAttribute("followvo", followList);

        String edit_date = "2024-07-25";

        List<GoalVO> goalWithFeedDataList = goalRepository.getDataByEmailAndDate(user.getEmail(), edit_date);

        List<Map<String, Object>> goalJsonList = new ArrayList<>(); // List<Map> 대신 List<Map<String, Object>> 사용
        for (GoalVO goal : goalWithFeedDataList) {
            Map<String, Object> goalMap = new HashMap<>();
            goalMap.put("goal_id", goal.getTodoTitleId());
            goalMap.put("goal_content", goal.getTodoTitle());
            goalMap.put("goal_email", goal.getEmail());
            goalMap.put("goal_openSetting", goal.getTitleTodoOpen());
            goalMap.put("goal_colorCode", goal.getColorCode());
            System.out.println("이것은 목표 색깔 코드: " + goal.getColorCode());

            // goal_feedList에 여러 개의 피드를 담기 위한 리스트 생성
            List<Map<String, Object>> feedJsonList = new ArrayList<>();
            for (FeedVO feed : goal.getFeedList()) {
                Map<String, Object> feedMap = getFeedMap(feed);
                feedJsonList.add(feedMap);
            }
            goalMap.put("goal_feedList", feedJsonList); // 피드 리스트를 추가

            goalJsonList.add(goalMap); // append 대신 add 사용
        }

        ObjectMapper mapper = new ObjectMapper();
        String json = null;
        try {
            json = mapper.writeValueAsString(goalJsonList);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }

        model.addAttribute("goalJsonData", json);

        return "feed";
    }

    private static Map<String, Object> getFeedMap(FeedVO feed) {
        Map<String, Object> feedMap = new HashMap<>();
        feedMap.put("todo_id", feed.getTodoId());
        feedMap.put("todo_email", feed.getEmail());
        feedMap.put("todo_content", feed.getTodoContent());
        feedMap.put("todo_todoCheck", feed.getTodoCheck());
        feedMap.put("todo_editDate", feed.getTodoEditDate());
        feedMap.put("todo_memo", feed.getTodoMemo());
        feedMap.put("todo_alarm", feed.getTodoAlarm());
        feedMap.put("todo_image", feed.getTodoImage());
        return feedMap;
    }

//    @RequestMapping(value = "/feed.do", method = RequestMethod.POST)
//    public String feedOk(Model model, HttpServletRequest request,
//                         FeedVO list) {
//
////        int result = feedRepository.selectOne(vo);
////
////        if(result > 0) {
////            return "redirect:/Todo/feed.do";
////        }else {
////            return "redirect:/Todo/feed.do";
////        }
//    }

    @ResponseBody
    @RequestMapping(value = "/donut_chart_count_change.do", method = RequestMethod.POST, produces = "application/json")
    public Map<String, Object> donutDateChange(
            Model model, FeedVO vo,
            @SessionAttribute(name = "user") UserVO user
    ) {

        Calendar calendar = Calendar.getInstance();
        // 현재 연도와 월 가져오기
        int year = calendar.get(Calendar.YEAR);
        int month = calendar.get(Calendar.MONTH) + 1; // 0~11, 0이 1월

        // 이메일과 해당 월의 날짜별 완료된 투두 개수 조회
        List<Map<String, Object>> completedTodosPerDay = feedRepository.findCompletedTodosPerDay(user.getEmail(), year, month);
        model.addAttribute("todoCount", completedTodosPerDay);


        // 해당 달의 날짜 데이터의 정보
        model.addAttribute("dateInfo", donutCalendarInfo());


        // 필요한 추가 데이터를 여기에 설정
        Map<String, Object> response = new HashMap<>();
        response.put("todoCount", completedTodosPerDay);
        response.put("dateInfo", donutCalendarInfo());

        return response;
    }





    @ResponseBody
    @RequestMapping(value = "/donut_date_change.do", method = RequestMethod.POST, produces = "application/json")
    public Map<String, Object> donutDateChange(
            @SessionAttribute(name = "user") UserVO user,
            @RequestParam(name = "todo_edit_date") String date
    ) {
        // 이메일과 오늘의 피드 목록을 가져오기
        List<FeedVO> feedList = feedRepository.findByEmailAndEditDate(user.getEmail(), date);

        // 이메일로 목표 목록 가져오기
        List<GoalVO> goalList = goalRepository.getList(user.getEmail());


        // 필요한 추가 데이터를 여기에 설정
        Map<String, Object> response = new HashMap<>();
        response.put("feedList", feedList);
        response.put("goalList", goalList);
        response.put("date", date); // 예시로 요청받은 날짜를 반환에 포함

        // 필요에 따라 더 많은 데이터를 추가할 수 있습니다

        return response;
    }


    @ResponseBody
    @RequestMapping(value = "/new_todo_create.do", method = RequestMethod.POST, produces = "application/json")
    public Map<String, Object> donutDateChange(
            @SessionAttribute(name = "user") UserVO user,
            @RequestBody FeedVO feedVO
    ) {
        feedVO.setEmail(user.getEmail());


        // 이메일과 수정날짜를 기반으로 insert하고 성공유무를 반환해줌
        int success_true = feedRepository.insertData(feedVO);


        // 필요한 추가 데이터를 여기에 설정
        Map<String, Object> response = new HashMap<>();
        response.put("newTodoId", feedVO.getTodoId());
        response.put("success", success_true);


        return response;
    }

    @ResponseBody
    @RequestMapping(value = "check_box_change.do", method = RequestMethod.POST, produces = "application/json")
    public Map<String, Object> editCheckBox(
            @SessionAttribute(name = "user") UserVO user,
            @RequestBody FeedVO feedVO
    ) {

        System.out.println("체크박스의 투두 ID"+feedVO.getTodoId());
        System.out.println("체크박스의 투두_체크박스_상태"+feedVO.getTodoCheck());

        if (Objects.equals(feedVO.getTodoCheck(), "완료")) {
            feedVO.setTodoCheck("미완료");
        } else if (Objects.equals(feedVO.getTodoCheck(), "미완료")) {
            feedVO.setTodoCheck("완료");
        }

        System.out.println("체크박스의 투두_체크박스_데이터 set이후"+feedVO.getTodoCheck());


        int success_true = feedRepository.checkBoxChange(feedVO);
        System.out.println(success_true+"체크박스 업데이트 결과 성공시 1을 반환");

        Map<String, Object> response = new HashMap<>();
        response.put("success", success_true);

        return response;
    }



    @ResponseBody
    @RequestMapping(value = "delete_todo.do", method = RequestMethod.POST, produces = "application/json")
    public Map<String, Object> editTodoContent(
            @SessionAttribute(name = "user") UserVO user,
            @RequestBody FeedVO feedVO
    ) {
        System.out.println("투두아이디: "+feedVO.getTodoId());


        int success_true = feedRepository.deleteTodo(feedVO);
        System.out.println("성공적으로 수정시 1 = "+success_true);

        Map<String, Object> response = new HashMap<>();
        response.put("success", success_true);

        return response;
    }

    @ResponseBody
    @RequestMapping(value = "selected_todo_anotherDay_move.do", method = RequestMethod.POST, produces = "application/json")
    public Map<String, Object> selectedTodoAnotherDayMove(
            @SessionAttribute(name = "user") UserVO user,
            @RequestBody FeedVO feedVO
    ) {
        System.out.println("투두아이디: "+feedVO.getTodoId());
        System.out.println("투두_수정날짜: "+feedVO.getTodoEditDate());

        int success_true = feedRepository.selectedTodoAnotherDayMove(feedVO);
        System.out.println("성공적으로 수정시 1 = "+success_true);

        Map<String, Object> response = new HashMap<>();
        response.put("success", success_true);

        return response;
    }




    @ResponseBody
    @RequestMapping(value = "edit_todo_content.do", method = RequestMethod.POST, produces = "application/json")
    public Map<String, Object> delete_todo(
            @SessionAttribute(name = "user") UserVO user,
            @RequestBody FeedVO feedVO
    ) {
        System.out.println("투두아이디: "+feedVO.getTodoId());


        int success_true = feedRepository.deleteTodo(feedVO);
        System.out.println("성공적으로 수정시 1 = "+success_true);

        Map<String, Object> response = new HashMap<>();
        response.put("success", success_true);

        return response;
    }




    @RequestMapping(value = "/routine.do", method = RequestMethod.GET)
    public String routine(Model model, RoutineVO vo, GoalVO gvo) {

        List<RoutineVO> routinelist = routineRepository.getAllData(vo);
        List<GoalVO> goalList = goalRepository.getAllData(gvo);
        System.out.println(vo);
        System.out.println(routinelist);
        model.addAttribute("routinevo", routinelist);
        model.addAttribute("goalvo", goalList);

        return "routine";
    }


    public Map<String, Object> donutCalendarInfo() {
        // 현재 날짜로 캘린더 객체 생성
        Calendar calendar = Calendar.getInstance();

        // 현재 연도와 월 가져오기
        int year = calendar.get(Calendar.YEAR);
        int month = calendar.get(Calendar.MONTH) + 1; // 0~11로 반환되므로 1을 더해 1~12로 변환
        int today = calendar.get(Calendar.DATE); // 현재 날짜

        // 현재 월의 첫 번째 날짜로 설정
        calendar.set(year, calendar.get(Calendar.MONTH), 1);

        // 해당 월의 첫 번째 날짜의 요일 가져오기 (1: 일요일, 2: 월요일, ...)
        int firstDayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);

        // 해당 월의 마지막 날짜 가져오기
        int lastDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);

        // 캘린더 정보 맵 생성
        Map<String, Object> calendarMap = new HashMap<>();
        calendarMap.put("year", String.format("%04d", year)); // 연도는 4자리로 포맷팅
        calendarMap.put("month", String.format("%02d", month)); // 월을 두 자리로 포맷팅
        calendarMap.put("firstDayOfWeek", firstDayOfWeek);
        calendarMap.put("lastDay", String.format("%02d", lastDay)); // 마지막 날짜를 두 자리로 포맷팅
        calendarMap.put("today", String.format("%02d", today)); // 오늘 날짜를 두 자리로 포맷팅

        return calendarMap;
    }


}
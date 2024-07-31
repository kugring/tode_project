package com.ezen.backend.controller;

import com.ezen.backend.Repository.GoalRepository;
import com.ezen.backend.Repository.UserRepository;
import com.ezen.backend.VO.FollowVO;
import com.ezen.backend.VO.GoalVO;
import com.ezen.backend.VO.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller

@RequestMapping("/todo")
public class GoalController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    GoalRepository goalRepository;


    @RequestMapping(value = "/goal.do", method = RequestMethod.GET)
    public String goal(Model model, HttpServletRequest request,
                       GoalVO goalvo, @SessionAttribute(name = "user") UserVO user
    ) {

        List<GoalVO> goallist = goalRepository.getList(user.getEmail());

        model.addAttribute("goalVo", goallist);
        return "goal";
    }



    @RequestMapping(value = "/goal.do", method = RequestMethod.POST)
    public String goalOk(Model model, @RequestBody GoalVO goalVo){

        int goalId = goalRepository.insertData(goalVo);


        model.addAttribute("goalVo", goalId);


        return "goal";

    }

}

package com.ezen.backend.controller;

import com.ezen.backend.Repository.DiaryRepository;
import com.ezen.backend.Repository.UserRepository;
import com.ezen.backend.VO.DiaryListVO;
import com.ezen.backend.VO.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.util.List;

@Controller

@RequestMapping("/todo")
public class DiaryController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    DiaryRepository diaryRepository;


    @RequestMapping(value = "/diary.do", method = RequestMethod.GET)
    public String diary(Model model, DiaryListVO diaryvo, @SessionAttribute(name = "user") UserVO user) {


        List<DiaryListVO> diarylist = diaryRepository.selectList(user.getEmail());
        model.addAttribute("diaryvo", diarylist);

        return "diary";
    }



}

package com.ezen.backend.controller;

import java.util.List;

import javax.servlet.ServletContext;


import com.ezen.backend.Repository.*;
import com.ezen.backend.VO.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import org.springframework.web.bind.annotation.SessionAttribute;

@Controller

@RequestMapping("/todo")
public class FollowController {
    @Autowired
    UserRepository userRepository;

    @Autowired
    ServletContext servletContext;

    @Autowired
    FollowRepository followRepository;




    @RequestMapping(value = "/follow.do", method = RequestMethod.GET)
    public String follow(Model model,
                         FollowVO vo,
                         @SessionAttribute(name = "user") UserVO user
    ) {

        List<FollowVO> followerList = followRepository.getFollower(user.getEmail());
        List<FollowVO> followingList = followRepository.getFollowing(user.getEmail());
        System.out.println(vo);
        System.out.println(followerList);
        model.addAttribute("followerVo", followerList);
        model.addAttribute("followingVo", followingList);

        return "follow";
    }


    @RequestMapping(value = "/follow.do", method = RequestMethod.POST)
    public String followOk(Model model,
                         FollowVO vo,
                         @SessionAttribute(name = "user") UserVO user
    ){


        List<FollowVO> followerList = followRepository.getFollower(user.getEmail());
        List<FollowVO> followingList = followRepository.getFollowing(user.getEmail());

        model.addAttribute("followerVo", followerList);
        model.addAttribute("followingVo", followingList);

        return "follow";

    }

}
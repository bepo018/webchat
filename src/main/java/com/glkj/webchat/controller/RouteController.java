package com.glkj.webchat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Copyright © 2018 The so-called success is to make extraordinary persistence
 * in the ordinary.
 * 
 * @author qsjteam
 * @date 2018-10-1
 */
@Controller
@RequestMapping(value = "")
public class RouteController {

    @RequestMapping(value = "")
    public String index() {
        return "redirect:/user/guest";
    }

    @RequestMapping(value = "/mobile")
    public String mobile() {
        return "index_m2";
    }
}

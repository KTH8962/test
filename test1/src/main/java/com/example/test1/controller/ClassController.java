package com.example.test1.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.ClassService;
import com.google.gson.Gson;

@Controller
public class ClassController {
	
	@Autowired
	ClassService classService;
	
	@RequestMapping("/class.do")
	 public String classList(Model model) throws Exception{

        return "/class";
    }

	@RequestMapping(value = "/class-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchBbsList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = classService.classList(map);
		return new Gson().toJson(resultMap);
	}
}

package com.example.test1.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.TestService;
import com.example.test1.model.Test;
import com.google.gson.Gson;

@Controller
public class TestController {
	//전담전담전담전담전담전담전담전담
	@Autowired
	TestService testService;
	
	@RequestMapping("/test.do") 
    public String main(Model model) throws Exception{

        return "/test-list";
    }
	@RequestMapping("/insert.do") 
    public String insert(Model model) throws Exception{

        return "/test-insert";
    }
	
	@RequestMapping(value = "/test.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchBbsList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = testService.testList(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/testRemove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String remove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = testService.testRemove(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/testUpdate.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String update(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = testService.testUpdate(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/testInsert.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String insert(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = testService.testInsert(map);
		return new Gson().toJson(resultMap);
	}
}



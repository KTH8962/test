package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.ClassMapper;

@Service
public class ClassServiceImpl implements ClassService{
	
	@Autowired
	ClassMapper classMapper;

	@Override
	public HashMap<String, Object> classList(HashMap<String, Object> map) {
		HashMap<String,Object> resultMap = new HashMap<>();
		List<Class> classList = classMapper.classList(map);
		resultMap.put("classList", classList);
		resultMap.put("result", "success");
		return resultMap;
	}

	@Override
	public HashMap<String, Object> classJoin(HashMap<String, Object> map) {
		HashMap<String,Object> resultMap = new HashMap<>();
		classMapper.classJoin(map);
		resultMap.put("result", "success");
		return resultMap;
	}
	

}

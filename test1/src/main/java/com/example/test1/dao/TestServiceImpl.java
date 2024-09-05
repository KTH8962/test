package com.example.test1.dao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.TestMapper;
import com.example.test1.model.Test;

@Service
public class TestServiceImpl implements TestService{

	@Autowired
	TestMapper testMapper;

	@Override
	public HashMap<String, Object> testList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			Test product = testMapper.testList(map);
			if(product == null) {
				resultMap.put("result", "null");
			} else {
				resultMap.put("product", product);
				resultMap.put("result", "success");
			}
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> testRemove(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			testMapper.testRemove(map);
			resultMap.put("result", "success");
			resultMap.put("message", "삭제 됨");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
			resultMap.put("message", "삭제 실패");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> testUpdate(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			testMapper.testUpdate(map);
			resultMap.put("result", "success");
			resultMap.put("message", "수정 됨");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
			resultMap.put("message", "수정 실패");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> testInsert(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			testMapper.testInsert(map);
			resultMap.put("result", "success");
			resultMap.put("message", "저장 됨");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
			resultMap.put("message", "저장 실패");
		}
		return resultMap;
	}

}

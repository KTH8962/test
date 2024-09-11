package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.OnedayMapper;
import com.example.test1.model.Oneday;

@Service
public class OnedayServiceImpl implements OnedayService{
	
	@Autowired
	OnedayMapper onedayMapper;

	@Override
	public HashMap<String, Object> onedayList(HashMap<String, Object> map) {
		HashMap<String,Object> resultMap = new HashMap<>();
		List<Oneday> onedayList = onedayMapper.onedayList(map);
		resultMap.put("onedayList", onedayList);
		resultMap.put("result", "success");
		return resultMap;
	}

	@Override
	public HashMap<String, Object> onedayJoin(HashMap<String, Object> map) {
		HashMap<String,Object> resultMap = new HashMap<>();
		onedayMapper.onedayJoin(map);
		resultMap.put("result", "success");
		return resultMap;
	}

	@Override
	public HashMap<String, Object> onedayDetail(HashMap<String, Object> map) {
		HashMap<String,Object> resultMap = new HashMap<>();
		Oneday onedayDetail = onedayMapper.onedayDetail(map);
		System.out.println(onedayDetail);
		resultMap.put("onedayDetail", onedayDetail);
		resultMap.put("result", "success");
		return resultMap;
	}
	

}

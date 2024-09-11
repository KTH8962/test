package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Oneday;

@Mapper
public interface OnedayMapper {
	
	List<Oneday> onedayList(HashMap<String,Object> map);
	
	void onedayJoin(HashMap<String,Object> map);
	
	Oneday onedayDetail(HashMap<String,Object> map);

}

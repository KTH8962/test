package com.example.test1.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Test;

@Mapper
public interface TestMapper {
	Test testList(HashMap<String, Object> map);
	
	void testRemove(HashMap<String, Object> map);
	
	void testUpdate(HashMap<String, Object> map);
	
	void testInsert(HashMap<String, Object> map);
}

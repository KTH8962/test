package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ClassMapper {
	
	List<Class> classList(HashMap<String,Object> map);
	
	void classJoin(HashMap<String,Object> map);

}

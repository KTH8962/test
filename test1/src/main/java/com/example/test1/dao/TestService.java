package com.example.test1.dao;

import java.util.HashMap;

public interface TestService {
	HashMap<String, Object> testList(HashMap<String, Object> map);
	
	HashMap<String, Object> testRemove(HashMap<String, Object> map);
	
	HashMap<String, Object> testUpdate(HashMap<String, Object> map);
	
	HashMap<String, Object> testInsert(HashMap<String, Object> map);
}

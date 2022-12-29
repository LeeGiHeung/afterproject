package com.lgh.mysql.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.lgh.mysql.dto.UserJoinDto;

public class UserDao implements testDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override 
	public String userJoin(UserJoinDto dto) {
		System.out.println("user join method");
		String result = null;
		try {
			int res = sqlSession.insert("userJoin", dto);
			System.out.println("result: "+res);
			if(res > 0) {
				result="success";
			}
			else {
				result="falied";
			}
		}
		catch(Exception e){
			e.printStackTrace();
			result="failed";
		}
				
		return result;
	}
	
}

package com.lgh.mysql.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;

import com.lgh.mysql.dao.UserDao;
import com.lgh.mysql.dto.UserJoinDto;
import com.lgh.mysql.util.Constant;

public class UserJoinCommand implements testCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		BCryptPasswordEncoder passwordEncoder= Constant.passwordEncoder;	
		
		int num = (int) System.currentTimeMillis();
		String id = request.getParameter("pid");
		String pw = request.getParameter("ppw");
		String address = request.getParameter("paddress");
		String hobby = request.getParameter("phobby");
		String myself = request.getParameter("pmyself");
		
		String pw_org = pw;
		pw = passwordEncoder.encode(pw_org);
		UserJoinDto dto = new UserJoinDto(num,id,pw,address,hobby,myself);
		System.out.println(id+"/"+num+"/"+pw+address+"/"+myself);
		
		UserDao udao = Constant.udao;
		String result = udao.userJoin(dto);
		request.setAttribute("result", result);

	}

}

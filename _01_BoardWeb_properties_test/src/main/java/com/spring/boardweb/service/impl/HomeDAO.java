package com.spring.boardweb.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.boardweb.HomeVO;

//DAO : Data Access Object
//DB�� ���� �����ϴ� ��ü
@Repository
public class HomeDAO {
	//DB�� �����ؾ� �ϹǷ� SqlSessionTemplate�� �ϳ� �����´�
	@Autowired
	SqlSessionTemplate mybatis;
	
	public List<HomeVO> getNameList(){
		//ù ��° �Ű������δ� mapper�� namespace.������id
		//�� ��° �Ű������δ� �������� ���� �Ķ���͵�
		return mybatis.selectList("HomeDAO.getNameList");
	}

}
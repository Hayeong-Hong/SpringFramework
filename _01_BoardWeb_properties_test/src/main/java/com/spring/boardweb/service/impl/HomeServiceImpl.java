package com.spring.boardweb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.boardweb.HomeVO;
import com.spring.boardweb.service.HomeService;

//������̼����� ��Ī�� ����� �� �� ����
//��Ī���� �����ϸ� Ŭ���������� ù ���ڸ� �ҹ��ڷ� ����� �̸����� ��ü����
@Service
public class HomeServiceImpl implements HomeService {
	@Autowired
	HomeDAO homeDAO;
	
	@Override
	public List<HomeVO> getNameList(){
		return homeDAO.getNameList();
	}

}
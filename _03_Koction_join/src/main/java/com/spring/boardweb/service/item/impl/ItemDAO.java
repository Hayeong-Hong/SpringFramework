package com.spring.boardweb.service.item.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.boardweb.ItemVO;

@Repository
public class ItemDAO {
	@Autowired
	SqlSessionTemplate mybatis;

	public List<ItemVO> getItemList(Map<String, String> paramMap) {
		// TODO Auto-generated method stub
		return mybatis.selectList("ItemDAO.getItemList");
	}

}

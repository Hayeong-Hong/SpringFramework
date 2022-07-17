package com.spring.boardweb.service.item.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.boardweb.ItemVO;
import com.spring.boardweb.service.item.ItemService;

@Service
public class ItemServiceImpl implements ItemService{
	@Autowired
	ItemDAO ItemDAO;

	@Override
	public List<ItemVO> getItemList(Map<String, String> paramMap) {
		// TODO Auto-generated method stub
		return ItemDAO.getItemList(paramMap);
	}

}

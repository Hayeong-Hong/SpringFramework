package com.spring.boardweb.service.item;

import java.util.List;
import java.util.Map;

import com.spring.boardweb.ItemVO;

public interface ItemService {

	List<ItemVO> getItemList(Map<String, String> paramMap);

}

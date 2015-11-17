package kr.or.object.dao;

import kr.or.object.vo.Language;

public interface LanguageDao {
	Language getLanguageByName(String name);
}

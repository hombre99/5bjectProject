package kr.or.object.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.object.dao.LanguageDao;
import kr.or.object.vo.Language;
@Service("languageService")
public class LanguageServiceImpl implements LanguageService{

	private LanguageDao dao;
		
	public LanguageServiceImpl() {
		super();
	}
	@Autowired
	public LanguageServiceImpl(LanguageDao dao) {
		this.dao = dao;
	}

	@Override
	public Language findLanguageByName(String name) {
		return dao.getLanguageByName(name);
	}
 
}

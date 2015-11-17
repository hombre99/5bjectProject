package kr.or.object.dao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.object.vo.Language;

@Repository("languageDao")
public class LanguageDaoImpl implements LanguageDao {
	private SqlSessionTemplate session;
	
	@Autowired
	public LanguageDaoImpl(SqlSessionTemplate session) {
		super();
		this.session = session;
	}

	@Override
	public Language getLanguageByName(String name) {
		return session.selectOne("languageMapper.selectLanguageByName", name);
	}
	
}

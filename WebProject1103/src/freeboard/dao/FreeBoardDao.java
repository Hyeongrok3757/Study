package freeboard.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import freeboard.dto.FreeBoardDto;
import freeboard.dto.FreeSearchDto;

public class FreeBoardDao {

	private static SqlSessionFactory sqlMapper;

	static {
		try {
			String resource = "mybatis/SqlMapConfig.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<FreeBoardDto> getAllList() {

		SqlSession session = sqlMapper.openSession();
		List<FreeBoardDto> list = null;
		try {
			list = session.selectList("getAllList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	public void fboardinsert(FreeBoardDto dto) {
		SqlSession session = sqlMapper.openSession();
		try {
			session.insert("fboardinsert", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public FreeBoardDto freeboardDetail(String fb_num) {
		FreeBoardDto dto = new FreeBoardDto();
		SqlSession session = sqlMapper.openSession();
		try {
			dto = session.selectOne("freeboardDetail", fb_num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	public void freeboarddelete(String fb_num) {
		SqlSession session = sqlMapper.openSession();
		try {
			session.delete("freeboarddelete", fb_num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

	}

	public void freereadCount(String fb_num) {
		SqlSession session = sqlMapper.openSession();
		try {
			session.update("freereadCount", fb_num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

	}

	public void freeboardUpdate(FreeBoardDto dto) {
		SqlSession session = sqlMapper.openSession();
		try {
			session.update("freeboardUpdate", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public List<FreeBoardDto> freeboardsearch(String sc, String ss) {
		FreeSearchDto sdto = new FreeSearchDto(sc, "%" + ss + "%");
		SqlSession session = sqlMapper.openSession();
		List<FreeBoardDto> list = null;

		try {
			list = session.selectList("freeboardsearch", sdto);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<FreeBoardDto> freeboardSelectList(int num) {
		// TODO Auto-generated method stub
		num = (num-1)*15 + 1;
		if(num==0) num = 1;
		SqlSession session = sqlMapper.openSession();
		List<FreeBoardDto> list = null;
		try {
			list = session.selectList("freeboardselectlist", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;

	}

}

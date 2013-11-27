package noticeboard.dao;

import java.io.InputStream;
import java.util.List;

import noticeboard.dto.NoticeBoardDto;
import noticeboard.dto.NoticeSearchDto;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import freeboard.dto.FreeBoardDto;
import freeboard.dto.FreeSearchDto;

public class NoticeBoardDao {

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

	public List<NoticeBoardDto> noticegetAllList() {

		SqlSession session = sqlMapper.openSession();
		List<NoticeBoardDto> list = null;
		try {
			list = session.selectList("noticegetAllList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	public void noticeboardinsert(NoticeBoardDto dto) {
		SqlSession session = sqlMapper.openSession();
		try {
			session.insert("noticeboardinsert", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public NoticeBoardDto noticeboardDetail(String nb_num) {
		NoticeBoardDto dto = new NoticeBoardDto();
		SqlSession session = sqlMapper.openSession();
		try {
			dto = session.selectOne("noticeboardDetail", nb_num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	public void noticeboarddelete(String nb_num) {
		SqlSession session = sqlMapper.openSession();
		try {
			session.delete("noticeboarddelete", nb_num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

	}

	public void noticereadCount(String nb_num) {
		SqlSession session = sqlMapper.openSession();
		try {
			session.update("noticereadCount", nb_num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

	}

	public void noticeboardUpdate(NoticeBoardDto dto) {
		SqlSession session = sqlMapper.openSession();
		try {
			session.update("noticeboardUpdate", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public List<NoticeBoardDto> noticeboardsearch(String sc, String ss) {
		NoticeSearchDto sdto = new NoticeSearchDto(sc, "%" + ss + "%");
		SqlSession session = sqlMapper.openSession();
		List<NoticeBoardDto> list = null;

		try {
			list = session.selectList("noticeboardsearch", sdto);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<NoticeBoardDto> noticeboardSelectList(int num) {
		// TODO Auto-generated method stub
		num = (num-1)*15 + 1;
		if(num==0) num = 1;
		SqlSession session = sqlMapper.openSession();
		List<NoticeBoardDto> list = null;
		try {
			list = session.selectList("noticeboardselectlist", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;

	}

}

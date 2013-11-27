package fileboard.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import fileboard.dto.FileBoardDto;

public class FileBoardDao {

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
	
	public void fileboardinsert(FileBoardDto dto){
		SqlSession session = sqlMapper.openSession();
		try {
			session.insert("fileboardinsert", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}
	}

	public List<FileBoardDto> getAllList() {
		// TODO Auto-generated method stub
		SqlSession session = sqlMapper.openSession();
		List<FileBoardDto> list = null;
		try {
			list = session.selectList("getAllFileList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			session.close();
		}
		
		return list;
	}
}

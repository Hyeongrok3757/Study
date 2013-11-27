package member.dao;

import java.io.IOException;
import java.io.InputStream;

import member.dto.MemberDto;
import member.dto.MemberSearchDto;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MemberDao {

	private static SqlSessionFactory sqlMapper;
	
	static{
		try {
			String resource = "mybatis/SqlMapConfig.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int memberInsert(MemberDto dto){
		
		SqlSession session = sqlMapper.openSession();
		int check=0;
		try {
			check = session.insert("memberinsert", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}
		return check;
	}
	
	public MemberDto memberSearch(MemberSearchDto dto){
		
		SqlSession session = sqlMapper.openSession();
		MemberDto result_dto = null;
		try {
			result_dto = session.selectOne("memberSearch", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result_dto;
		
	}
	
public MemberDto memberSearch(String id){
		
		SqlSession session = sqlMapper.openSession();
		MemberDto result_dto = null;
		try {
			result_dto = session.selectOne("memberStringSearch", id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result_dto;
		
	}

	public int memberIdCheck(String id) {
		SqlSession session = sqlMapper.openSession();
		Object check = null;
		try {
			check = session.selectOne("memberIdSearch", id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(check == null) return 0;
		else return 1;
	}

	public int memberEmailCheck(String email) {
		SqlSession session = sqlMapper.openSession();
		Object check = null;
		try {
			check = session.selectOne("memberEmailSearch", email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(check == null) return 0;
		else return 1;
	}

	public int memberUpdate(MemberDto dto) {
		
		SqlSession session = sqlMapper.openSession();
		int check = 0;
		try {
			check = session.update("memberUpdate", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return check;
	}

}
















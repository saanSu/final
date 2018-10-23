package app.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class EmployeeRepository {

	@Autowired
	SqlSessionTemplate template;
	
	public List<Map> getAllDepartments() {
		return template.selectList("employee.getAllDepartments");
	}
	
	public List<Map> getAllPositions() {
		return template.selectList("employee.getAllPositions");
	}
	
	public int checkEmployee(Map data) {
		return template.selectOne("employee.checkEmployee", data);
	}
	
	public Map getEmployee(String id) {
		return template.selectOne("employee.getEmployee", id);
	}
	
	public String getNewEmployeeId() {
		return "em"+ template.selectOne("employee.getEmployeeSeq");
	}
	
	public int addEmployee(Map map) {
		return template.insert("employee.addEmployee", map);
	}
	
	public int updatePass(Map map) {
		return template.update("employee.updatePass", map);
	}
}

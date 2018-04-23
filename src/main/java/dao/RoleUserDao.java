package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entity.Role;

@Repository
public class RoleUserDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	/* GET LIST USERS */
	public List<Role> getItems() {
		String sql = "SELECT role.id,role.name FROM role";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Role>(Role.class));
	}

	public Role getItemAdmin() {
		String sql = "SELECT role.id,role.name FROM role WHERE name = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { "ADMIN" }, new BeanPropertyRowMapper<Role>(Role.class));
	}
}

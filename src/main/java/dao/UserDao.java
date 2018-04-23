package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entity.User;

@Repository
public class UserDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	/* GET LIST USERS */
	public List<User> getItems() {
		String sql = "SELECT user.id,user.username,user.password,user.fullname,user.email,user.phone,user.address,user.date_create,user.active,role.id AS id_role,role.name AS nameRole FROM user JOIN role ON user.id_role = role.id";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<User>(User.class));
	}

	/* ADD USER */
	public int addItem(User objUser) {
		String sql = "INSERT INTO user (username,password,fullname,email,phone,address,id_role) VALUES (?,?,?,?,?,?,?) ";
		return jdbcTemplate.update(sql,
				new Object[] { objUser.getUsername(), objUser.getPassword(), objUser.getFullname(), objUser.getEmail(),
						objUser.getPhone(), objUser.getAddress(), objUser.getId_role() });
	}

	/* GET ITEM USER BY ID */
	public User getItemById(int id) {
		String sql = "SELECT * FROM user WHERE id = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { id }, new BeanPropertyRowMapper<User>(User.class));
	}

	/* EDIT USER */
	public int editItem(User objUser) {
		String sql = "UPDATE user SET password = ?,fullname = ?, email = ?, phone = ?, address = ?, id_role = ? WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] { objUser.getPassword(), objUser.getFullname(), objUser.getEmail(),
				objUser.getPhone(), objUser.getAddress(), objUser.getId_role(), objUser.getId() });
	}

	/* DELETE USER */
	public int delItem(int id) {
		String sql = "DELETE FROM user WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] { id });
	}

	/* GET ITEM */
	public User getItemByUsername(String username) {
		String sql = "SELECT user.id,username,password,fullname,email,date_create,id_role,active,role.name AS nameRole FROM user INNER JOIN role ON user.id_role = role.id WHERE username = ?";
		try {
			return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class),
					new Object[] { username });
		} catch (DataAccessException e) {
			return null;
		}
	}

	public int changePassByUsername(String username, String pass) {
		String sql = "UPDATE user SET password = ? WHERE username = ?";
		return jdbcTemplate.update(sql, new Object[] { pass, username });
	}
}

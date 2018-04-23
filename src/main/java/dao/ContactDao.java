package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entity.Contact;

@Repository
public class ContactDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	/* SHOW ALL CONTACT */
	public List<Contact> getItems() {
		String sql = "SELECT * FROM contact ORDER BY readed ASC";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Contact>(Contact.class));
	}

	/* SET READED FOR ITEM */
	public int readed(int id) {
		String sql = "UPDATE contact SET readed = 1 WHERE id= ?";
		return jdbcTemplate.update(sql, new Object[] { id });
	}

	/* SET READED FOR ALL */
	public int setReadedForAll() {
		String sql = "UPDATE contact SET readed = 1 WHERE readed =0";
		return jdbcTemplate.update(sql, new Object[] {});
	}

	/* COUNT CONTACT */
	public int countNumberContact() {
		String sql = "SELECT COUNT(*) AS sumContact FROM contact WHERE readed = 0";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	/* GET ITEM */
	public Contact getItem(int id) {
		String sql = "SELECT * FROM contact WHERE id = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { id }, new BeanPropertyRowMapper<Contact>(Contact.class));
	}

	/* LIST CONTACT NOT READ */
	public List<Contact> getListContactNotRead() {
		String sql = "SELECT * FROM contact WHERE readed = 0";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Contact>(Contact.class));
	}

	public void addItem(Contact contact) {
		String sql = "INSERT INTO contact(name_customer,email,phone,message) VALUES(?,?,?,?)";
		jdbcTemplate.update(sql, new Object[] { contact.getName_customer(), contact.getEmail(), contact.getPhone(),
				contact.getMessage() });
	}
	public int deleteItem(int id) {
		String sql = "DELETE FROM contact WHERE id =?";
		return jdbcTemplate.queryForObject(sql, new Object [] {id},Integer.class);
	}
}

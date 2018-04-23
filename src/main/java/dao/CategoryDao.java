package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entity.Category;

@Repository
public class CategoryDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	/* GET ITEMS CATEGORY */
	public List<Category> getItems() {
		String sql = "SELECT * FROM category";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Category>(Category.class));
	}

	public List<Category> getItemsMostView() {
		String sql = "SELECT * FROM category ORDER BY cat_view DESC LIMIT 6";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Category>(Category.class));
	}

	/* ADD CATEGORY */
	public int addItem(Category objCat) {
		String sql = "INSERT INTO category (name) VALUES (?) ";
		return jdbcTemplate.update(sql, new Object[] { objCat.getName() });
	}

	/* EDIT CATEGORY */
	public int editItem(Category objCat) {
		String sql = "UPDATE category SET name = ? WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] { objCat.getName(), objCat.getId() });
	}

	/* DELETE CATEGORY */
	public int delItem(int id) {
		String sql = "DELETE FROM category WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] { id });
	}

	/* GET ITEM CATEGORY */
	public Category getItem(int id) {
		String sql = "SELECT * FROM category WHERE id = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { id },
				new BeanPropertyRowMapper<Category>(Category.class));

	}

	/* CHECK NAME */
	public Category checkNameCategory(String nameCat) {
		String sql = "SELECT * FROM category WHERE name like '%" + nameCat + "%'";
		return jdbcTemplate.queryForObject(sql, new Object[] {}, new BeanPropertyRowMapper<Category>(Category.class));
	}

}

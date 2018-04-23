package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entity.Image;

@Repository
public class ImageDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	/* GET LIST */
	public List<Image> getItems(int id_product) {
		String sql = "SELECT * FROM image WHERE id_product = ?";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Image>(Image.class), new Object[] { id_product });
	}

	/* ADD ITEM */
	public int addItem(Image image) {
		String sql = "INSERT INTO image(name,id_product) VALUES(?,?)";
		return jdbcTemplate.update(sql, new Object[] { image.getName(), image.getId_product() });
	}

	/* GET ITEM */
	public Image getItemById(int id_image) {
		String sql = "SELECT * FROM image WHERE id = ?";
		try {
			return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<Image>(Image.class),
					new Object[] { id_image });
		} catch (DataAccessException e) {
			return null;
		}

	}

	/* DEL ITEM */
	public int delItem(int id_image) {
		String sql = "DELETE FROM image WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] { id_image });
	}
}

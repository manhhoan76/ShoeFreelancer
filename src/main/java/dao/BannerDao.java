package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entity.Banner;

@Repository
public class BannerDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	/* GET ITEMS */
	public List<Banner> getItems() {
		String sql = "SELECT * FROM banner";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Banner>(Banner.class));
	}

	public List<Banner> getItemsForPublic() {
		String sql = "SELECT * FROM banner ORDER BY id DESC LIMIT 6";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Banner>(Banner.class));
	}

	/* GET ITEM BANNER */
	public Banner getItemByID(int id) {
		String sql = "SELECT * FROM banner WHERE id = ?";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[] { id },
					new BeanPropertyRowMapper<Banner>(Banner.class));
		} catch (DataAccessException e) {
			return null;
		}
	}

	/* ADD BANNER */
	public int addItem(String picture) {
		String sql = "INSERT INTO banner (picture) VALUES (?) ";
		return jdbcTemplate.update(sql, new Object[] { picture });
	}

	/* EDIT BANNER */
	public int editItem(Banner banner) {
		String sql = "UPDATE banner SET picture = ? WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] { banner.getPicture(), banner.getId() });
	}

	/* DELETE BANNER */
	public int delItem(int id) {
		String sql = "DELETE FROM banner WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] { id });
	}

}

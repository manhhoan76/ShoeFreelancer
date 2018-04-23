package dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entity.InfoShop;

@Repository
public class InfoShopDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	/* GET INFO */
	public InfoShop getInfo() {
		String sql = "SELECT * FROM infoShop WHERE id = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { 1 },
				new BeanPropertyRowMapper<InfoShop>(InfoShop.class));
	}

	/* EDIT INFO */
	public int editItem(InfoShop infoShop) {
		String sql = "UPDATE infoShop SET name = ?,phone = ?,email = ?,address = ?,link_fb = ?,zalo = ? WHERE id = 1";
		return jdbcTemplate.update(sql, new Object[] { infoShop.getName(), infoShop.getPhone(), infoShop.getEmail(),
				infoShop.getAddress(), infoShop.getLink_fb(), infoShop.getZalo() });
	}
}

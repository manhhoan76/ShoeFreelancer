
package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entity.Product;

@Repository
public class ProductDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	/* GET LIST */
	public List<Product> getItems() {
		String sql = "SELECT product.id,product.name,product.product_count_search,id_category,id_user,product.date_create,product_view,description,price,picture,category.name AS nameCat,user.fullname as nameUser FROM product LEFT JOIN user ON id_user = user.id INNER JOIN category ON id_category = category.id";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Product>(Product.class));
	}

	public List<Product> getItemsByIdCat(int idCat) {
		String sql = "SELECT product.id,product.name,product.product_count_search,id_category,id_user,product.date_create,product_view,description,price,picture,category.name AS nameCat,user.fullname as nameUser FROM product LEFT JOIN user ON id_user = user.id INNER JOIN category ON id_category = category.id WHERE id_category = ?";
		return jdbcTemplate.query(sql, new Object[] { idCat }, new BeanPropertyRowMapper<Product>(Product.class));
	}

	public List<Product> getItemsByIdCatLimit9(int idCat, int offset) {
		String sql = "SELECT product.id,product.name,product.product_count_search,id_category,id_user,product.date_create,product_view,description,price,picture,category.name AS nameCat,user.fullname as nameUser FROM product LEFT JOIN user ON id_user = user.id INNER JOIN category ON id_category = category.id WHERE id_category = ? ORDER BY product.id LIMIT ?,9";
		return jdbcTemplate.query(sql, new Object[] { idCat, offset },
				new BeanPropertyRowMapper<Product>(Product.class));
	}

	public List<Product> getItemsByIdCatLimit9NameAsc(int idCat, int offset) {
		String sql = "SELECT product.id,product.name,product.product_count_search,id_category,id_user,product.date_create,product_view,description,price,picture,category.name AS nameCat,user.fullname as nameUser FROM product LEFT JOIN user ON id_user = user.id INNER JOIN category ON id_category = category.id WHERE id_category = ? ORDER BY product.name ASC LIMIT ?,9";
		return jdbcTemplate.query(sql, new Object[] { idCat, offset },
				new BeanPropertyRowMapper<Product>(Product.class));
	}

	public List<Product> getItemsByIdCatLimit9NameDESC(int idCat, int offset) {
		String sql = "SELECT product.id,product.name,product.product_count_search,id_category,id_user,product.date_create,product_view,description,price,picture,category.name AS nameCat,user.fullname as nameUser FROM product LEFT JOIN user ON id_user = user.id INNER JOIN category ON id_category = category.id WHERE id_category = ? ORDER BY product.name DESC LIMIT ?,9";
		return jdbcTemplate.query(sql, new Object[] { idCat, offset },
				new BeanPropertyRowMapper<Product>(Product.class));
	}

	public List<Product> getItemsByIdCatLimit9IdDESC(int idCat, int offset) {
		String sql = "SELECT product.id,product.name,product.product_count_search,id_category,id_user,product.date_create,product_view,description,price,picture,category.name AS nameCat,user.fullname as nameUser FROM product LEFT JOIN user ON id_user = user.id INNER JOIN category ON id_category = category.id WHERE id_category = ? ORDER BY product.id DESC LIMIT ?,9";
		return jdbcTemplate.query(sql, new Object[] { idCat, offset },
				new BeanPropertyRowMapper<Product>(Product.class));
	}

	public List<Product> getItemsByIdCatLimit9PriceDESC(int idCat, int offset) {
		String sql = "SELECT product.id,product.name,product.product_count_search,id_category,id_user,product.date_create,product_view,description,price,picture,category.name AS nameCat,user.fullname as nameUser FROM product LEFT JOIN user ON id_user = user.id INNER JOIN category ON id_category = category.id WHERE id_category = ? ORDER BY product.price DESC LIMIT ?,9";
		return jdbcTemplate.query(sql, new Object[] { idCat, offset },
				new BeanPropertyRowMapper<Product>(Product.class));
	}

	public List<Product> getItemsByIdCatLimit9PriceASC(int idCat, int offset) {
		String sql = "SELECT product.id,product.name,product.product_count_search,id_category,id_user,product.date_create,product_view,description,price,picture,category.name AS nameCat,user.fullname as nameUser FROM product LEFT JOIN user ON id_user = user.id INNER JOIN category ON id_category = category.id WHERE id_category = ? ORDER BY product.price ASC LIMIT ?,9";
		return jdbcTemplate.query(sql, new Object[] { idCat, offset },
				new BeanPropertyRowMapper<Product>(Product.class));
	}

	public List<Product> getItemsSameCatByIdCat(int idCat, int idProduct) {
		String sql = "SELECT product.id,product.name,product.product_count_search,id_category,id_user,product.date_create,product_view,description,price,picture,category.name AS nameCat,user.fullname as nameUser FROM product LEFT JOIN user ON id_user = user.id INNER JOIN category ON id_category = category.id WHERE id_category = ? AND product.id != ? limit 3";
		return jdbcTemplate.query(sql, new Object[] { idCat, idProduct },
				new BeanPropertyRowMapper<Product>(Product.class));
	}

	public List<Product> getListItemsSearchByKey(String search, int offset) {
		String sql = "SELECT product.id,product.name,product.product_count_search,id_category,id_user,product.date_create,product_view,description,price,picture,category.name AS nameCat,user.fullname as nameUser FROM product LEFT JOIN user ON id_user = user.id INNER JOIN category ON id_category = category.id WHERE product.name LIKE '%"
				+ search + "%' LIMIT ?,12";
		return jdbcTemplate.query(sql, new Object [] {offset}, new BeanPropertyRowMapper<Product>(Product.class));
	}

	public List<Product> getItemsMostView() {
		String sql = "SELECT product.id,product.name,product.product_count_search,id_category,id_user,product.date_create,product_view,description,price,picture,category.name AS nameCat,user.fullname as nameUser FROM product LEFT JOIN user ON id_user = user.id INNER JOIN category ON id_category = category.id ORDER BY product_view DESC LIMIT 8";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Product>(Product.class));
	}

	public List<Product> getItemsMostSearch() {
		String sql = "SELECT product.id,product.name,product.product_count_search,id_category,id_user,product.date_create,product_view,description,price,picture,category.name AS nameCat,user.fullname as nameUser FROM product LEFT JOIN user ON id_user = user.id INNER JOIN category ON id_category = category.id ORDER BY product_count_search DESC LIMIT 8";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Product>(Product.class));
	}

	public List<Product> getItemsMostNew() {
		String sql = "SELECT product.id,product.name,product.product_count_search,id_category,id_user,product.date_create,product_view,description,price,picture,category.name AS nameCat,user.fullname as nameUser FROM product LEFT JOIN user ON id_user = user.id INNER JOIN category ON id_category = category.id ORDER BY product.id DESC LIMIT 8";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Product>(Product.class));
	}

	public List<Product> getItemsRandom(int numRandom) {
		String sql = "SELECT product.id,product.name,id_category,id_user,product.date_create,product_view,description,price,picture,category.name AS nameCat,user.fullname as nameUser FROM product LEFT JOIN user ON id_user = user.id INNER JOIN category ON id_category = category.id LIMIT ?,16";
		return jdbcTemplate.query(sql, new Object[] { numRandom }, new BeanPropertyRowMapper<Product>(Product.class));
		
	}

	public Product getItemsByIdCatLimit1(int idCat) {
		String sql = "SELECT product.id,product.name,id_category,id_user,product.date_create,product_view,description,price,picture,category.name AS nameCat,user.fullname as nameUser FROM product LEFT JOIN user ON id_user = user.id INNER JOIN category ON id_category = category.id WHERE id_category = ? LIMIT 1";
		return jdbcTemplate.queryForObject(sql, new Object[] { idCat },
				new BeanPropertyRowMapper<Product>(Product.class));
	}

	/* CHECK NAME PRODUCT FOR ADD ITEM */
	public int checkNameProductForAdd(String name) {
		String sql = "SELECT COUNT(*) FROM product WHERE name = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { name }, Integer.class);
	}

	/* CHECK NAME PRODUCT FOR EDIT ITEM */
	public int checkNameProductForEdit(Product product) {
		String sql = "SELECT COUNT(*) FROM product WHERE name = ? && id != ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { product.getName(), product.getId() }, Integer.class);
	}

	/* ADD ITEM */
	public int addItem(Product product) {
		String sql = "INSERT INTO product(name,id_category,id_user,description,price,picture) VALUES(?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] { product.getName(), product.getId_category(),
				product.getId_user(), product.getDescription(), product.getPrice(), product.getPicture() });
	}

	/* GET ITEM */
	public Product getItemByImage(String namePicture) {
		String sql = "SELECT product.id,product.name,product.product_count_search,id_category,id_user,product.date_create,product_view,description,price,picture,category.name AS nameCat,user.fullname as nameUser FROM product LEFT JOIN user ON id_user = user.id INNER JOIN category ON id_category = category.id WHERE picture = ?";
		try {
			return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<Product>(Product.class),
					new Object[] { namePicture });
		} catch (DataAccessException e) {
			return null;
		}
	}

	public Product getItemByID(int id) {
		String sql = "SELECT product_count_search,product.id,product.name,id_category,id_user,product.date_create,product_view,description,price,picture,category.name AS nameCat,user.fullname as nameUser FROM product LEFT JOIN user ON id_user = user.id INNER JOIN category ON id_category = category.id WHERE product.id = ?";
		try {
			return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<Product>(Product.class),
					new Object[] { id });
		} catch (DataAccessException e) {
			return null;
		}
	}

	/* EDIT ITEM */
	public int editItem(Product product) {
		String sql = "UPDATE product SET name = ?, id_category = ?, description = ?, price = ?, picture = ? WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] { product.getName(), product.getId_category(),
				product.getDescription(), product.getPrice(), product.getPicture(), product.getId() });
	}

	/* DEL ITEM */
	public int delItem(int id_product) {
		String sql = "DELETE FROM product WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] { id_product });
	}

	/* UPDATE PRODUCT VIEW */
	public int editViewProduct(int productView, int id) {
		String sql = "UPDATE product SET product_view = ? WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] { productView, id });
	}

	/* COUNT NUMBER PRODUCT BY ID_CAT */
	public int countNumberProduct(int id_cat) {
		String sql = "SELECT COUNT(*) AS numberProduct FROM product WHERE id_category = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { id_cat }, Integer.class);
	}

	/*COUNT NUMBER PRODUCT SEARCH BY KEY*/
	public int countNumberProductSearchByKey(String  key) {
		String sql = "SELECT COUNT(*) AS numberProduct FROM product LEFT JOIN user ON id_user = user.id INNER JOIN category ON id_category = category.id WHERE product.name LIKE '%"
				+ key + "%'";
		return jdbcTemplate.queryForObject(sql,  Integer.class);
	}

	
	/* COUNT ALL */
	public int countProduct() {
		String sql = "SELECT COUNT(*) AS numberProduct FROM product";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	public void updateSearchViewProduct(int id, int newSearchViewProduct) {
		String sql = "UPDATE product SET product_count_search = ? WHERE id = ?";
		jdbcTemplate.update(sql, new Object[] { newSearchViewProduct, id });
	}

}

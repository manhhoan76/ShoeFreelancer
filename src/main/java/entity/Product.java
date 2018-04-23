package entity;

import java.sql.Timestamp;

import org.springframework.format.annotation.NumberFormat;

public class Product {
	private int id;
	private String name;
	private int id_category;
	private int id_user;
	private Timestamp date_create;
	private int product_view;
	private String description;
	private int price;
	private String nameCat;
	private String nameUser;
	private String picture;
	private int product_count_search;

	public Product() {
		super();
	}

	public Product(int id, String name, int id_category, int id_user, Timestamp date_create, int product_view,
			String description, int price, String nameCat, String nameUser, String picture, int product_count_search) {
		super();
		this.id = id;
		this.name = name;
		this.id_category = id_category;
		this.id_user = id_user;
		this.date_create = date_create;
		this.product_view = product_view;
		this.description = description;
		this.price = price;
		this.nameCat = nameCat;
		this.nameUser = nameUser;
		this.picture = picture;
		this.product_count_search = product_count_search;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getId_category() {
		return id_category;
	}

	public void setId_category(int id_category) {
		this.id_category = id_category;
	}

	public int getId_user() {
		return id_user;
	}

	public void setId_user(int id_user) {
		this.id_user = id_user;
	}

	public Timestamp getDate_create() {
		return date_create;
	}

	public void setDate_create(Timestamp date_create) {
		this.date_create = date_create;
	}

	public int getProduct_view() {
		return product_view;
	}

	public void setProduct_view(int product_view) {
		this.product_view = product_view;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getNameCat() {
		return nameCat;
	}

	public void setNameCat(String nameCat) {
		this.nameCat = nameCat;
	}

	public String getNameUser() {
		return nameUser;
	}

	public void setNameUser(String nameUser) {
		this.nameUser = nameUser;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public int getProduct_count_search() {
		return product_count_search;
	}

	public void setProduct_count_search(int product_count_search) {
		this.product_count_search = product_count_search;
	}

	public void setPrice(int price) {
		this.price = price;
	}

}

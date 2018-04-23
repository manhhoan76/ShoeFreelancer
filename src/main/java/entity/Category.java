package entity;

public class Category {
	private int id;
	private String name;
	private int cat_view;

	public Category(int id, String name, int cat_view) {
		super();
		this.id = id;
		this.name = name;
		this.cat_view = cat_view;
	}

	public Category() {
		super();
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

	public int getCat_view() {
		return cat_view;
	}

	public void setCat_view(int cat_view) {
		this.cat_view = cat_view;
	}

}

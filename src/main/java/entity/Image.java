package entity;

public class Image {
	private int id;
	private String name;
	private int id_product;

	public Image() {
		super();
	}

	public Image(int id, String name, int id_product) {
		super();
		this.id = id;
		this.name = name;
		this.id_product = id_product;
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

	public int getId_product() {
		return id_product;
	}

	public void setId_product(int id_product) {
		this.id_product = id_product;
	}

}

package entity;

public class Banner {
	private int id;
	private String picture;
	private int active;

	public Banner() {
		super();
	}

	public Banner(int id, String picture, int active) {
		super();
		this.id = id;
		this.picture = picture;
		this.active = active;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

}

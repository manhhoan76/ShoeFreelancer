package entity;

public class InfoShop {
	private int id;
	private String name;
	private String phone;
	private String email;
	private String address;
	private String link_fb;
	private String zalo;

	public InfoShop(int id, String name, String phone, String email, String address, String link_fb, String zalo) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.link_fb = link_fb;
		this.zalo = zalo;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLink_fb() {
		return link_fb;
	}

	public void setLink_fb(String link_fb) {
		this.link_fb = link_fb;
	}

	public String getZalo() {
		return zalo;
	}

	public void setZalo(String zalo) {
		this.zalo = zalo;
	}

	public InfoShop() {
		super();
	}


}

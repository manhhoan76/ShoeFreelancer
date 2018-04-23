package entity;

public class Contact {
	private int id;
	private String name_customer;
	private String email;
	private int phone;
	private String message;
	private int readed;

	public Contact() {
		super();
	}

	public Contact(int id, String name_customer, String email, int phone, String message, int readed) {
		super();
		this.id = id;
		this.name_customer = name_customer;
		this.email = email;
		this.phone = phone;
		this.message = message;
		this.readed = readed;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName_customer() {
		return name_customer;
	}

	public void setName_customer(String name_customer) {
		this.name_customer = name_customer;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getReaded() {
		return readed;
	}

	public void setReaded(int readed) {
		this.readed = readed;
	}

}

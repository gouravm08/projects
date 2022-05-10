package Model;

public class MedicineBeen {
	private int product_id;
	private String product_name;
	private String company_name;
	private String product_category;
	private int product_quantity;
	private double product_price;
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getProduct_category() {
		return product_category;
	}
	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}
	public int getProduct_quantity() {
		return product_quantity;
	}
	public void setProduct_quantity(int product_quantity) {
		this.product_quantity = product_quantity;
	}
	public double getProduct_price() {
		return product_price;
	}
	public void setProduct_price(double product_price) {
		this.product_price = product_price;
	}
	@Override
	public String toString() {
		return "MedicineBeen [product_id=" + product_id + ", product_name=" + product_name + ", company_name="
				+ company_name + ", product_category=" + product_category + ", product_quantity=" + product_quantity
				+ ", product_price=" + product_price + "]";
	}
	

}

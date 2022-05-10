package Model;

public class Items {
	private String product_name;
	private String product_category;
	private int entered_quantity;
	private double product_ppu;
	private double calculated_amount;
	
	
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_category() {
		return product_category;
	}
	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}
	public int getEntered_quantity() {
		return entered_quantity;
	}
	public void setEntered_quantity(int entered_quantity) {
		this.entered_quantity = entered_quantity;
	}
	public double getProduct_ppu() {
		return product_ppu;
	}
	public void setProduct_ppu(double product_ppu) {
		this.product_ppu = product_ppu;
	}
	public double getCalculated_amount() {
		return calculated_amount;
	}
	public void setCalculated_amount(double calculated_amount) {
		this.calculated_amount = calculated_amount;
	}
	@Override
	public String toString() {
		return "Items [product_name=" + product_name + ", product_category=" + product_category
				+ ", entered_quantity=" + entered_quantity + ", product_ppu=" + product_ppu + ", calculated_amount="
				+ calculated_amount + "]";
	}
	
}

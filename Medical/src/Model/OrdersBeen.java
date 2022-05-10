package Model;

import java.util.ArrayList;

public class OrdersBeen {
	private int orderID;
	private String userName;
	public  int total_quantity;
	public  double total_amount;
	 ArrayList<Items> items=new ArrayList<Items>();
	 
	public int getOrderID() {
		return orderID;
	}
	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}
	public String getuserName() {
		return userName;
	}
	public void setuserName(String userName) {
		this.userName = userName;
	}
	public int getTotal_quantity() {
		return total_quantity;
	}
	public void setTotal_quantity(int total_quantity) {
		this.total_quantity = total_quantity;
	}
	public double getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(double total_amount) {
		this.total_amount = total_amount;
	}
	public ArrayList<Items> getItems() {
		return items;
	}
	public void setItems(ArrayList<Items> items) {
		this.items = items;
	}
	@Override
	public String toString() {
		return "OrdersBeen [orderID=" + orderID + ", userName=" + userName + ", total_quantity=" + total_quantity
				+ ", total_amount=" + total_amount + ", items=" + items + "]";
	}
	 

}

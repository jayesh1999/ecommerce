package mycart1.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.transaction.Transactional;

@Entity
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int pId;
	private String pName;
	@Column(length=3000)
	private String pDesc;
	private String pPhoto;
	private int pPrice;
	private int pDiscount;
	private int PQuantity;
	
	@ManyToOne //(fetch = FetchType.LAZY)
	private Category category;
	
	
	
	
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public Product(String pName, String pDesc, String pPhoto, int pPrice, int pDiscount, int pQuantity,
			Category category) {
		super();
		this.pName = pName;
		this.pDesc = pDesc;
		this.pPhoto = pPhoto;
		this.pPrice = pPrice;
		this.pDiscount = pDiscount;
		PQuantity = pQuantity;
		this.category = category;
	}
	public Product(int pId, String pName, String pDesc, String pPhoto, int pPrice, int pDiscount, int pQuantity,
			Category category) {
		super();
		this.pId = pId;
		this.pName = pName;
		this.pDesc = pDesc;
		this.pPhoto = pPhoto;
		this.pPrice = pPrice;
		this.pDiscount = pDiscount;
		PQuantity = pQuantity;
		this.category = category;
	}
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product(int pId, String pName, String pDesc, String pPhoto, int pPrice, int pDiscount, int pQuantity) {
		super();
		this.pId = pId;
		this.pName = pName;
		this.pDesc = pDesc;
		this.pPhoto = pPhoto;
		this.pPrice = pPrice;
		this.pDiscount = pDiscount;
		PQuantity = pQuantity;
	}
	public Product(String pName, String pDesc, String pPhoto, int pPrice, int pDiscount, int pQuantity) {
		super();
		this.pName = pName;
		this.pDesc = pDesc;
		this.pPhoto = pPhoto;
		this.pPrice = pPrice;
		this.pDiscount = pDiscount;
		PQuantity = pQuantity;
	}
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpDesc() {
		return pDesc;
	}
	public void setpDesc(String pDesc) {
		this.pDesc = pDesc;
	}
	public String getpPhoto() {
		return pPhoto;
	}
	public void setpPhoto(String pPhoto) {
		this.pPhoto = pPhoto;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public int getpDiscount() {
		return pDiscount;
	}
	public void setpDiscount(int pDiscount) {
		this.pDiscount = pDiscount;
	}
	public int getPQuantity() {
		return PQuantity;
	}
	public void setPQuantity(int pQuantity) {
		PQuantity = pQuantity;
	}
	

	//calculate orice after discount
	public int getPriceAfterApplyingDiscount() {
		
		int d = (int) ((this.getpDiscount()/100.0)* this.getpPrice());
		return this.getpPrice() -d;
	}
	
}

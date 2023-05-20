package hcmuteshop.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Nationalized;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int productId;
	
	@Nationalized
	private String name;
	private String slug;
	
	@Nationalized
	private String description;
	private Double price;
	private Double prmotionalPrice;
	private int quantity;
	private int sold = 0;
	private Boolean isActive = true;
	private Boolean isSelling = true;
	private String video;
	private float rating;
	private String image;
	private Date createdAt = new Date();
	private Date updatedAt = new Date();
	
	
	public Product(String name, String description, Double price, int quantity, int sold, Boolean isActive, Store store,
			Category category) {
		super();
		this.name = name;
		this.description = description;
		this.price = price;
		this.quantity = quantity;
		this.sold = sold;
		this.isActive = isActive;
		this.store = store;
		this.category = category;
	}

	@OneToMany(mappedBy = "product")
	private List<ProductImage> productImages = new ArrayList<ProductImage>();
	
	@OneToMany(mappedBy = "product")
	private List<Review> reviews = new ArrayList<Review>();
	
	@ManyToOne(fetch = FetchType.LAZY)
	private Store store;
	
	@OneToMany(mappedBy = "product")
	private List<CartItem> cartItems = new ArrayList<CartItem>();
	
	@OneToMany(mappedBy = "product")
	private List<OrderItem> orderItems = new ArrayList<OrderItem>();
	
	@OneToMany(mappedBy = "product")
	private List<UserFollowProduct> userFollowProducts = new ArrayList<UserFollowProduct>();
	
	@ManyToOne(fetch = FetchType.LAZY)
	private Category category;
	
	@OneToMany(mappedBy = "product")
	private List<StyleValue> styleValues = new ArrayList<StyleValue>();
}

package com.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Store {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long storeId;
	
	private String name;
	private String bio;
	private String slug;
	private Boolean isActive;
	private Boolean isOpen;
	private String avatar;
	private String cover;
	private Integer point;
	private Float rating;
	private Double e_wallet;
	private Date createdAt;
	private Date updatedAt;
	
	@OneToOne
	@JoinColumn(name = "userId", referencedColumnName = "userId")
	private User user;
	
	@OneToMany(mappedBy = "store")
	private List<UserFollowStore> userFollowStores = new ArrayList<UserFollowStore>();
	
	@OneToMany(mappedBy = "store")
	private List<Transaction> transactions = new ArrayList<Transaction>();

	@OneToMany(mappedBy = "store")
	private List<Review> reviews = new ArrayList<Review>();
	
	@OneToMany(mappedBy = "store")
	private List<Order> orders = new ArrayList<Order>();
	
	@OneToMany(mappedBy = "store")
	private List<Product> products = new ArrayList<Product>();
	
	@OneToMany(mappedBy = "store")
	private List<Cart> carts = new ArrayList<Cart>();
	
	@ManyToOne(fetch = FetchType.LAZY)
	private StoreLevel storeLevel;
	
	@OneToOne
	@JoinColumn(name = "commissionId", referencedColumnName = "commissionId")
	private Commission commission;
}

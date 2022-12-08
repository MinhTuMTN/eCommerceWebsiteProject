package com.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Nationalized;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Account")
public class User implements Serializable{
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userId;
	
	@Nationalized
	private String firstName;
	
	@Nationalized
	private String lastName;
	
	private String slug;
	
	private String id_card;
	
	private String email;
	
	private String phone;
	
	private Boolean isEmailActive;
	
	private Boolean isPhoneActive;
	
	private String salt;
	
	private String password;
	
	private String hashed_password;
	
	private Integer role;
	
	@Nationalized
	private String address;
	
	private String avatar;
	
	private int point;
	
	private Double e_wallet;
	
	private Date createdAt;
	
	private Date updatedAt;
	
	private Boolean isActived = true;
	
	
	
	public User(String firstName, String lastName, String slug, String id_card, String email, String phone,
			Boolean isEmailActive, Boolean isPhoneActive, String salt, String password , String hashed_password, Integer role,
			String address, String avatar, int point, Double e_wallet, Date createdAt, Date updatedAt,
			UserLevel userLevel) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.slug = slug;
		this.id_card = id_card;
		this.email = email;
		this.phone = phone;
		this.isEmailActive = isEmailActive;
		this.isPhoneActive = isPhoneActive;
		this.salt = salt;
		this.password = password;
		this.hashed_password = hashed_password;
		this.role = role;
		this.address = address;
		this.avatar = avatar;
		this.point = point;
		this.e_wallet = e_wallet;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.userLevel = userLevel;
	}

	public User(String firstName, String lastName, String email, String phone, String password, Integer role, String address,
			String avatar) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phone = phone;
		this.password = password;
		this.role = role;
		this.address = address;
		this.avatar = avatar;
		this.isActived = true;
	}

	@OneToOne
	@JoinColumn(name = "userLevelId", referencedColumnName = "userLevelId")
	private UserLevel userLevel;
	
	@OneToMany(mappedBy = "user")
	private List<Order> orders = new ArrayList<Order>();
	
	@OneToMany(mappedBy = "user")
	private List<UserFollowStore> userFollowStores = new ArrayList<UserFollowStore>();

	@OneToOne(mappedBy = "user", fetch = FetchType.LAZY)
	private Store store;
	
	@OneToMany(mappedBy = "user")
	private List<Transaction> transactions = new ArrayList<Transaction>();
	
	@OneToMany(mappedBy = "user")
	private List<Review> reviews = new ArrayList<Review>();
	
	@OneToMany(mappedBy = "user")
	private List<Cart> carts = new ArrayList<Cart>();
	
	@OneToMany(mappedBy = "user")
	private List<UserFollowProduct> userFollowProducts = new ArrayList<UserFollowProduct>();
}

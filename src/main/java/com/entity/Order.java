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
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "UserOrder")
public class Order {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int orderId;
	
	private String address;	
	private String phone;	
	private Integer status;	
	private Boolean isPaidBefore = true;	
	private Double amountFromUser = 0D;
	private Double amountFromStore;
	private Double amountToStore;
	private Double amountToGD;
	private Date createdAt;
	private Date updatedAt;
	
	@ManyToOne(fetch = FetchType.LAZY)
	private User user;
	
	@OneToOne
	@JoinColumn(name = "deliveryId", referencedColumnName = "deliveryId")
	private Delivery delivery;
	
	@OneToMany(mappedBy = "order")
	private List<OrderItem> orderItems = new ArrayList<OrderItem>();

	@OneToMany(mappedBy = "user")
	private List<Review> reviews = new ArrayList<Review>();
	
	@ManyToOne(fetch = FetchType.LAZY)
	private Store store;
}

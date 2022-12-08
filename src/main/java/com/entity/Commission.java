package com.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Commission {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long commissionId;
	
	private String name;
	private Double cost;
	private String description;
	private Boolean isDeleted;
	private Date createdAt;
	private Date updatedAt;	
	
	@OneToOne(mappedBy = "commission", fetch = FetchType.LAZY)
	private Store store;
}

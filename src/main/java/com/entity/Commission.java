package com.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import org.hibernate.annotations.Nationalized;

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
	@Nationalized
	private String name;
	private Double cost;
	@Nationalized
	private String description;
	private Boolean isDeleted = false;
	private Date createdAt = new Date();
	private Date updatedAt = new Date();	
	
	@OneToOne(mappedBy = "commission", fetch = FetchType.LAZY)
	private Store store;
}

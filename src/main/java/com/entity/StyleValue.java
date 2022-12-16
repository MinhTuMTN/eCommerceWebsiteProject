package com.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Nationalized;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class StyleValue {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long styleValueId;
	@Nationalized
	private String name;
	private Boolean isDeleted = false;
	private Date createdAt;
	private Date updatedAt;
	
	@ManyToOne(fetch = FetchType.LAZY)
	private Style style;
	
	@ManyToOne(fetch = FetchType.LAZY)
	private Product product;
}

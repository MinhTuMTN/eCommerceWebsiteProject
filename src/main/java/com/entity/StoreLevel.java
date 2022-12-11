package com.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Nationalized;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class StoreLevel {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long storeLevelId;
	@Nationalized
	private String name;
	private int minPoint;
	private float discount;
	private Boolean isDeleted = false;
	private Date createdAt;
	private Date updatedAt;
	
	@OneToMany(mappedBy = "storeLevel")
	private List<Store> stores = new ArrayList<Store>();
}

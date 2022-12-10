package com.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import org.hibernate.annotations.Nationalized;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
@Entity
public class UserLevel {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userLevelId;
	
	@NonNull
	@Nationalized
	private String name;
	
	@NonNull
	private Integer minPoint;
	
	@NonNull
	private Double discount;
	
	@NonNull
	private Boolean isDeleted = false;
	
	@NonNull
	private Date createdAt;
	
	@NonNull
	private Date updatedAt;
	
	@OneToOne(mappedBy = "userLevel")
	private User user;
}

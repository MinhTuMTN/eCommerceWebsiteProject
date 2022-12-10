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
public class Category {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long categoryId;
	
	@Nationalized
	private String name;
	private String slug;
	private String image;
	private Boolean isDeleted = false;
	private Date createdAt;
	private Date updatedAt;
	
	@OneToMany(mappedBy = "category")
	private List<Product> products = new ArrayList<Product>();
	
	@OneToMany(mappedBy = "category")
	private List<Style> styles = new ArrayList<Style>();
}

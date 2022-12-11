package com.entity;

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
public class Style {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long styleId;
	@Nationalized
	private String name;
	private Boolean isDeleted = false;
	private Date createdAt;
	private Date updatedAt;

	@ManyToOne(fetch = FetchType.LAZY)
	private Category category;
	
	@OneToMany(mappedBy = "style")
	private List<StyleValue> styleValues = new ArrayList<StyleValue>();
}

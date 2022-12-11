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
import lombok.NonNull;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Message {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long messageId;
	
	@Nationalized
	@NonNull
	private String name;
	
	@NonNull
	private String email;
	
	@Nationalized
	@NonNull
	private String subject;
	
	@Nationalized
	@NonNull
	private String message;
	
	private Date createdDate = new Date();
	
	@ManyToOne(fetch = FetchType.LAZY)
	private User user;
}

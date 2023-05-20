package hcmuteshop.entity;

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
public class Delivery {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int deliveryId;
	
	@Nationalized
	private String name;
	private Double price = 0D;
	@Nationalized
	private String description;
	private Boolean isDeleted = false;
	private Date createdAt = new Date();
	private Date updatedAt = new Date();
	
	@OneToOne(mappedBy = "delivery", fetch = FetchType.LAZY)
	private Order order;
}

package com.model;

import com.entity.Product;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SellerBestProduct {
	private Product product;
	private Long count;
}

package com;

import java.time.LocalDate;
import java.util.Date;

public class test {
	public static void main(String[] args) {
		LocalDate localDate = LocalDate.now();
		System.out.println(localDate);
		Date startDate = DateUtils.asDate(LocalDate.of(localDate.getYear(), localDate.getMonthValue(), 1));
		System.out.println(startDate);
		Date endDate = DateUtils.asDate(LocalDate.of(localDate.getYear(), localDate.getMonthValue(), localDate.getMonthValue() == 2 ? 28 : 30));
		System.out.println(endDate);
	}
}

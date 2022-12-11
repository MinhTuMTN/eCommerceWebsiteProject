package com.controller.vendor;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DateUtils;
import com.dao.seller.impl.DAOOrderSellerImpl;
import com.entity.Store;
import com.model.SellerIncome;

@WebServlet(urlPatterns = "/seller/statistics")
public class StatisticsSellerController extends HttpServlet {
	DAOOrderSellerImpl daoOrderSellerImpl = new DAOOrderSellerImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("fnStatistic", true);
		Store store = SellerConfig.getStoreByCookies(req);
		// Set gía trị mặc định
		LocalDate localDate = LocalDate.now();
		Date startDate = DateUtils.asDate(LocalDate.of(localDate.getYear(), localDate.getMonthValue(), 1));
		Date endDate = DateUtils.asDate(LocalDate.of(localDate.getYear(), localDate.getMonthValue(), localDate.getMonthValue() == 2 ? 28 : 30));
		
		// Lấy giá trị từ view
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");		
		try {
			String startDateString = req.getParameter("dateStart");
			startDate = format.parse(startDateString);
			String endDateString = req.getParameter("dateEnd");
			endDate = format.parse(endDateString);
		} catch (Exception e) {
			//e.printStackTrace();
		}
		req.setAttribute("dateStart", format.format(startDate));
		req.setAttribute("dateEnd", format.format(endDate));
		
		//List<SellerIncome> sellerIncomes = daoOrderSellerImpl.salesStatisticsByDate(startDate, endDate) ;
		//req.setAttribute("sellerIncomes", sellerIncomes);
		
		
		req.getRequestDispatcher("/views/seller/statistic.jsp").forward(req, resp);
	}
}

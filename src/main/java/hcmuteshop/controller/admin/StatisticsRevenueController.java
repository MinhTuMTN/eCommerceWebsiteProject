package hcmuteshop.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hcmuteshop.dao.admin.impl.DAOStatisticRevenueImpl;
import hcmuteshop.entity.Order;
import hcmuteshop.entity.Product;
import hcmuteshop.entity.ProductBarChart;
import hcmuteshop.entity.ProductPieChart;

import com.google.gson.Gson;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = { "/admin/statistic-revenue" })
public class StatisticsRevenueController extends HttpServlet {
	DAOStatisticRevenueImpl daoStatisticRevenueImpl = new DAOStatisticRevenueImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long storeId = Long.valueOf(req.getParameter("storeId"));
		int totalOrders = daoStatisticRevenueImpl.countAllOrders(storeId);
		req.setAttribute("totalOrders", totalOrders);
		int totalProducts = daoStatisticRevenueImpl.countAllProducts(storeId);
		req.setAttribute("totalProducts", totalProducts);

		List<Order> top3Orders = daoStatisticRevenueImpl.getTop3Orders(storeId);
		req.setAttribute("top3Orders", top3Orders);

		List<Product> top3SoldProducts = daoStatisticRevenueImpl.getTop3SoldProducts(storeId);
		req.setAttribute("top3SoldProducts", top3SoldProducts);

		String chart = req.getParameter("chart");
		if (chart == null) {
			chart = "0";
		}
		String json = getJson(storeId, chart);
		System.out.print(json);
		req.setAttribute("json", json);
		req.setAttribute("chart", chart);
		req.setAttribute("storeId", storeId);
		req.getRequestDispatcher("/views/admin/statistic-revenue.jsp").forward(req, resp);
	}

	public String getJson(Long storeId, String chart) throws ServletException, IOException {
		List<Object[]> objects = daoStatisticRevenueImpl.getTotalSoldProduct(storeId);

		Gson gson = new Gson();
		if (chart.equals("0")) {
			List<ProductPieChart> productPieCharts = new ArrayList<>();
			for (Object[] object : objects) {
				productPieCharts.add(new ProductPieChart((String) object[0], (Integer) object[1]));
			}
			return gson.toJson(productPieCharts);

		} else if (chart.equals("1")) {
			List<ProductBarChart> productBarCharts = new ArrayList<>();
			for (Object[] object : objects) {
				productBarCharts.add(new ProductBarChart((Integer) object[1], (String) object[0]));
			}
			return gson.toJson(productBarCharts);
		}
		return null;

	}

}

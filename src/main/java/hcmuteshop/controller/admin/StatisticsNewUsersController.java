package hcmuteshop.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hcmuteshop.dao.admin.impl.DAOStatisticNewUsersImpl;
import hcmuteshop.dao.admin.impl.DAOUserImpl;
import hcmuteshop.entity.User;
import hcmuteshop.entity.UserBarChart;
import hcmuteshop.entity.UserPieChart;
import com.google.gson.Gson;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/admin/statistics")
public class StatisticsNewUsersController extends HttpServlet{
	DAOStatisticNewUsersImpl daoStatisticsNewUsersImpl = new DAOStatisticNewUsersImpl();
	DAOUserImpl daoUserImpl = new DAOUserImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Integer> top3 = daoStatisticsNewUsersImpl.getTop3UserByAmount();
		List<User> top3Users = new ArrayList<User>();
		for(int userId : top3) {
			top3Users.add(daoUserImpl.getUserById(userId));
		}
		req.setAttribute("top3Users", top3Users);
		
		String chart = req.getParameter("chart");
		if (chart == null) {
			chart = "0";
		}
		String json = getJson(chart);
		System.out.print(json);
		req.setAttribute("json", json);
		req.setAttribute("chart", chart);
		
		req.getRequestDispatcher("/views/admin/statistics.jsp").forward(req, resp);
	}
	
	public String getJson(String chart) throws ServletException, IOException {
		List<Object[]> objects = daoStatisticsNewUsersImpl.getTop10UsersAmount();

		Gson gson = new Gson();
		if (chart.equals("0")) {
			List<UserPieChart> userPieCharts = new ArrayList<>();
			for (Object[] object : objects) {
				User user = daoUserImpl.getUserById((Integer) object[0]);
				String name = user.getFirstName() + " " + user.getLastName();
				userPieCharts.add(new UserPieChart(name, (Double) object[1]));
			}
			return gson.toJson(userPieCharts);

		} else if (chart.equals("1")) {
			List<UserBarChart> userBarCharts = new ArrayList<>();
			for (Object[] object : objects) {
				User user = daoUserImpl.getUserById((Integer) object[0]);
				String name = user.getFirstName() + " " + user.getLastName();
				userBarCharts.add(new UserBarChart((Double) object[1], name));
			}
			return gson.toJson(userBarCharts);
		}
		return null;

	}
}

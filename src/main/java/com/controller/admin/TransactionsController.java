package com.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.admin.impl.DAOTransactionImpl;
import com.entity.Transaction;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = { "/admin/transactions", "/admin/transaction-detail" })
public class TransactionsController extends HttpServlet {
	DAOTransactionImpl daoTransactionImpl = new DAOTransactionImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURL().toString();

		if (url.contains("/transactions")) {
			transactionList(req, resp);
		} else if (url.contains("/transaction-detail")) {
			transactionDetail(req, resp);
		}
	}
	private void transactionDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long transactionId = Long.valueOf(req.getParameter("transactionId"));
		Transaction transaction = daoTransactionImpl.getTransactionnById(transactionId);

		if (transaction == null) {
			resp.sendRedirect(req.getContextPath() + "/admin/transactions");
			return;
		}

		req.setAttribute("transaction", transaction);

		req.getRequestDispatcher("/views/admin/transaction-detail.jsp").forward(req, resp);
		
	}
	private void transactionList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int pageSize = 4;
		int pageNumber = 0;

		float temp = (float) daoTransactionImpl.countAllTransactions() / pageSize;
		int totalPages = (float) ((int) temp) < temp ? (int) temp : (int) temp - 1;
		try {
			pageNumber = Integer.valueOf(req.getParameter("page"));
		} catch (Exception e) {
			// TODO: handle exception
		}

		List<Transaction> transactions = daoTransactionImpl.getAllTransactionsPagination(pageNumber, pageSize);

		req.setAttribute("transactions", transactions);
		req.setAttribute("totalPages", totalPages);
		req.setAttribute("number", pageNumber);
		req.getRequestDispatcher("/views/admin/transaction-list.jsp").forward(req, resp);
		
	}
}

package org.spring;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
@WebServlet(urlPatterns="/getData",name="dataservlet")
public class DataServlet extends HttpServlet{

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json;charset=utf-8");
		Map<String, Object>result=  new HashMap<String, Object>();
		List<Map<String, Object>>records=new ArrayList<Map<String, Object>>();
		for(int i=0;i<20;i++){
			Map<String, Object>pre = new HashMap<>();
			pre.put("name", "name12312"+i);
			pre.put("age", i);
			pre.put("address", "address"+i);
			records.add(pre);
		}
		result.put("rows", records);
//		page: "page",    // 表示请求页码的参数名称 
//	    rows: "pageSize"
		result.put("page", 1);
		result.put("pageSize", 20);
		result.put("records", 20);
		result.put("total", 1);
		Gson gson =new Gson();
		response.getWriter().println(gson.toJson(result));
	}
}

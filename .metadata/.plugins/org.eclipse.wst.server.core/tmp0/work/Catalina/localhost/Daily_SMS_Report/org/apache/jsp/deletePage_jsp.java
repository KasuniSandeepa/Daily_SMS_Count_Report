/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.46
 * Generated at: 2021-09-09 09:40:18 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Iterator;
import java.util.stream.Collector;
import java.util.stream.Stream;
import java.util.stream.Collectors;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import java.util.HashMap;
import Operations.SMSdb;
import java.util.List;
import java.util.Map;
import modle.Account;
import java.util.ArrayList;
import com.google.gson.Gson;
import Database.*;

public final class deletePage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("Database");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.sql.Connection");
    _jspx_imports_classes.add("java.util.Iterator");
    _jspx_imports_classes.add("java.util.HashMap");
    _jspx_imports_classes.add("java.util.stream.Collectors");
    _jspx_imports_classes.add("Operations.SMSdb");
    _jspx_imports_classes.add("java.util.ArrayList");
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("java.util.stream.Stream");
    _jspx_imports_classes.add("java.sql.ResultSet");
    _jspx_imports_classes.add("com.google.gson.Gson");
    _jspx_imports_classes.add("java.util.Map");
    _jspx_imports_classes.add("java.sql.Statement");
    _jspx_imports_classes.add("java.util.stream.Collector");
    _jspx_imports_classes.add("modle.Account");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("	\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!--\r\n");
      out.write("=========================================================\r\n");
      out.write(" Light Bootstrap Dashboard - v2.0.1\r\n");
      out.write("=========================================================\r\n");
      out.write("\r\n");
      out.write(" Product Page: https://www.creative-tim.com/product/light-bootstrap-dashboard\r\n");
      out.write(" Copyright 2019 Creative Tim (https://www.creative-tim.com)\r\n");
      out.write(" Licensed under MIT (https://github.com/creativetimofficial/light-bootstrap-dashboard/blob/master/LICENSE)\r\n");
      out.write("\r\n");
      out.write(" Coded by Creative Tim\r\n");
      out.write("\r\n");
      out.write("=========================================================\r\n");
      out.write("\r\n");
      out.write(" The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.  -->\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"utf-8\" />\r\n");
      out.write("<link rel=\"apple-touch-icon\" sizes=\"76x76\"\r\n");
      out.write("	href=\"./assets/img/apple-icon.png\">\r\n");
      out.write("<link rel=\"icon\" type=\"image/png\" href=\"./assets/img/favicon.ico\">\r\n");
      out.write("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\" />\r\n");
      out.write("<title>Light Bootstrap Dashboard - Free Bootstrap 4 Admin\r\n");
      out.write("	Dashboard by Creative Tim</title>\r\n");
      out.write("<meta\r\n");
      out.write("	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'\r\n");
      out.write("	name='viewport' />\r\n");
      out.write("<!--     Fonts and icons     -->\r\n");
      out.write("<link\r\n");
      out.write("	href=\"https://fonts.googleapis.com/css?family=Montserrat:400,700,200\"\r\n");
      out.write("	rel=\"stylesheet\" />\r\n");
      out.write("<link rel=\"stylesheet\"\r\n");
      out.write("	href=\"https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css\" />\r\n");
      out.write("<!-- CSS Files -->\r\n");
      out.write("<link href=\"./assets/css/bootstrap.min.css\" rel=\"stylesheet\" />\r\n");
      out.write("<link href=\"./assets/css/light-bootstrap-dashboard.css?v=2.0.0 \"\r\n");
      out.write("	rel=\"stylesheet\" />\r\n");
      out.write("<!-- CSS Just for demo purpose, don't include it in your project -->\r\n");
      out.write("<link href=\"./assets/css/demo.css\" rel=\"stylesheet\" />\r\n");
      out.write("<script type=\"text/javascript\" src=\"jquery-3.3.1.min.js\">\r\n");
      out.write("	\r\n");
      out.write("</script>\r\n");
      out.write("<script\r\n");
      out.write("	src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js\"\r\n");
      out.write("	type=\"text/javascript\"></script>\r\n");
      out.write("\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write(".alert {\r\n");
      out.write("	padding: 20px;\r\n");
      out.write("	background-color: #f44336;\r\n");
      out.write("	color: white;\r\n");
      out.write("	opacity: 1;\r\n");
      out.write("	transition: opacity 0.6s;\r\n");
      out.write("	margin-bottom: 15px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".alert.success {\r\n");
      out.write("	background-color: #4CAF50;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".closebtn {\r\n");
      out.write("	margin-left: 15px;\r\n");
      out.write("	color: white;\r\n");
      out.write("	font-weight: bold;\r\n");
      out.write("	float: right;\r\n");
      out.write("	font-size: 22px;\r\n");
      out.write("	line-height: 20px;\r\n");
      out.write("	cursor: pointer;\r\n");
      out.write("	transition: 0.3s;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".closebtn:hover {\r\n");
      out.write("	color: black;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".btn {\r\n");
      out.write("	transition-duration: 0.4s;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".btn:hover {\r\n");
      out.write("	background-color: #4CAF50; /* Green */\r\n");
      out.write("	color: white;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("	<div class=\"wrapper\">\r\n");
      out.write("		<div class=\"sidebar\" data-image=\"./assets/img/sidebar-5.jpg\"\r\n");
      out.write("			data-color=\"blue\">\r\n");
      out.write("			<!--\r\n");
      out.write("        Tip 1: You can change the color of the sidebar using: data-color=\"purple | blue | green | orange | red\"\r\n");
      out.write("\r\n");
      out.write("        Tip 2: you can also add an image using data-image tag\r\n");
      out.write("    -->\r\n");
      out.write("			<div class=\"sidebar-wrapper\">\r\n");
      out.write("				<div class=\"logo\">\r\n");
      out.write("					<a href=\"http://www.creative-tim.com\" class=\"simple-text\">\r\n");
      out.write("						Textware Daily SMS Count </a>\r\n");
      out.write("				</div>\r\n");
      out.write("				<ul class=\"nav\">\r\n");
      out.write("					<li><a class=\"nav-link\" href=\"index.jsp\"> <i\r\n");
      out.write("							class=\"nc-icon nc-chart-pie-35\"></i>\r\n");
      out.write("							<p>Dashboard</p>\r\n");
      out.write("					</a></li>\r\n");
      out.write("					<!-- <li>\r\n");
      out.write("                        <a class=\"nav-link\" href=\"./index.jsp\">\r\n");
      out.write("                            <i class=\"nc-icon nc-circle-09\"></i>\r\n");
      out.write("                            <p>User Profile</p>\r\n");
      out.write("                        </a>\r\n");
      out.write("                    </li> -->\r\n");
      out.write("					<li><a class=\"nav-link\" href=\"ViewSummaryByMonth.jsp\"> <i\r\n");
      out.write("							class=\"nc-icon nc-notes\"></i>\r\n");
      out.write("							<p>Table List</p>\r\n");
      out.write("					</a></li>\r\n");
      out.write("					<li><a class=\"nav-link\" href=\"MainCharts.jsp\"> <i\r\n");
      out.write("							class=\"nc-icon nc-paper-2\"></i>\r\n");
      out.write("							<p>View Charts</p>\r\n");
      out.write("					</a></li>\r\n");
      out.write("					<li class=\"nav-item active\"><a class=\"nav-link\"\r\n");
      out.write("						href=\"upload.jsp\"> <i class=\"nc-icon nc-atom\"></i>\r\n");
      out.write("							<p>Upload</p>\r\n");
      out.write("					</a></li>\r\n");
      out.write("					<!--   <li>\r\n");
      out.write("                        <a class=\"nav-link\" href=\"./maps.html\">\r\n");
      out.write("                            <i class=\"nc-icon nc-pin-3\"></i>\r\n");
      out.write("                            <p>Maps</p>\r\n");
      out.write("                        </a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    <li>\r\n");
      out.write("                        <a class=\"nav-link\" href=\"./notifications.html\">\r\n");
      out.write("                            <i class=\"nc-icon nc-bell-55\"></i>\r\n");
      out.write("                            <p>Notifications</p>\r\n");
      out.write("                        </a>\r\n");
      out.write("                    </li>-->\r\n");
      out.write("					<!--  <li class=\"nav-item active active-pro\">\r\n");
      out.write("                        <a class=\"nav-link active\" href=\"upgrade.html\">\r\n");
      out.write("                            <i class=\"nc-icon nc-alien-33\"></i>\r\n");
      out.write("                            <p>Upgrade to PRO</p>\r\n");
      out.write("                        </a>\r\n");
      out.write("                    </li> -->\r\n");
      out.write("				</ul>\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("		<div class=\"main-panel\">\r\n");
      out.write("			<!-- Navbar -->\r\n");
      out.write("			<nav class=\"navbar navbar-expand-lg \" color-on-scroll=\"500\">\r\n");
      out.write("				<div class=\"container-fluid\">\r\n");
      out.write("					<a class=\"navbar-brand\" href=\"#pablo\"> Delete</a>\r\n");
      out.write("					<button href=\"\" class=\"navbar-toggler navbar-toggler-right\"\r\n");
      out.write("						type=\"button\" data-toggle=\"collapse\"\r\n");
      out.write("						aria-controls=\"navigation-index\" aria-expanded=\"false\"\r\n");
      out.write("						aria-label=\"Toggle navigation\">\r\n");
      out.write("						<span class=\"navbar-toggler-bar burger-lines\"></span> <span\r\n");
      out.write("							class=\"navbar-toggler-bar burger-lines\"></span> <span\r\n");
      out.write("							class=\"navbar-toggler-bar burger-lines\"></span>\r\n");
      out.write("					</button>\r\n");
      out.write("					<div class=\"collapse navbar-collapse justify-content-end\"\r\n");
      out.write("						id=\"navigation\">\r\n");
      out.write("						<ul class=\"nav navbar-nav mr-auto\">\r\n");
      out.write("							<li class=\"nav-item\"><a href=\"#\" class=\"nav-link\"\r\n");
      out.write("								data-toggle=\"dropdown\"> <i class=\"nc-icon nc-palette\"></i> <span\r\n");
      out.write("									class=\"d-lg-none\">Dashboard</span>\r\n");
      out.write("							</a></li>\r\n");
      out.write("							<!--    <li class=\"dropdown nav-item\">\r\n");
      out.write("                                <a href=\"#\" class=\"dropdown-toggle nav-link\" data-toggle=\"dropdown\">\r\n");
      out.write("                                    <i class=\"nc-icon nc-planet\"></i>\r\n");
      out.write("                                    <span class=\"notification\">5</span>\r\n");
      out.write("                                    <span class=\"d-lg-none\">Notification</span>\r\n");
      out.write("                                </a>\r\n");
      out.write("                                <ul class=\"dropdown-menu\">\r\n");
      out.write("                                    <a class=\"dropdown-item\" href=\"#\">Notification 1</a>\r\n");
      out.write("                                    <a class=\"dropdown-item\" href=\"#\">Notification 2</a>\r\n");
      out.write("                                    <a class=\"dropdown-item\" href=\"#\">Notification 3</a>\r\n");
      out.write("                                    <a class=\"dropdown-item\" href=\"#\">Notification 4</a>\r\n");
      out.write("                                    <a class=\"dropdown-item\" href=\"#\">Another notification</a>\r\n");
      out.write("                                </ul>\r\n");
      out.write("                            </li>\r\n");
      out.write("                            <li class=\"nav-item\">\r\n");
      out.write("                                <a href=\"#\" class=\"nav-link\">\r\n");
      out.write("                                    <i class=\"nc-icon nc-zoom-split\"></i>\r\n");
      out.write("                                    <span class=\"d-lg-block\">&nbsp;Search</span>\r\n");
      out.write("                                </a>\r\n");
      out.write("                            </li>\r\n");
      out.write("                        </ul>\r\n");
      out.write("                        <ul class=\"navbar-nav ml-auto\">\r\n");
      out.write("                            <li class=\"nav-item\">\r\n");
      out.write("                                <a class=\"nav-link\" href=\"#pablo\">\r\n");
      out.write("                                    <span class=\"no-icon\">Account</span>\r\n");
      out.write("                                </a>\r\n");
      out.write("                            </li>\r\n");
      out.write("                            <li class=\"nav-item dropdown\">\r\n");
      out.write("                                <a class=\"nav-link dropdown-toggle\" href=\"http://example.com\" id=\"navbarDropdownMenuLink\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\r\n");
      out.write("                                    <span class=\"no-icon\">Dropdown</span>\r\n");
      out.write("                                </a>\r\n");
      out.write("                                <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdownMenuLink\">\r\n");
      out.write("                                    <a class=\"dropdown-item\" href=\"#\">Action</a>\r\n");
      out.write("                                    <a class=\"dropdown-item\" href=\"#\">Another action</a>\r\n");
      out.write("                                    <a class=\"dropdown-item\" href=\"#\">Something</a>\r\n");
      out.write("                                    <a class=\"dropdown-item\" href=\"#\">Something else here</a>\r\n");
      out.write("                                    <div class=\"divider\"></div>\r\n");
      out.write("                                    <a class=\"dropdown-item\" href=\"#\">Separated link</a>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </li>\r\n");
      out.write("                            <li class=\"nav-item\">\r\n");
      out.write("                                <a class=\"nav-link\" href=\"#pablo\">\r\n");
      out.write("                                    <span class=\"no-icon\">Log out</span>\r\n");
      out.write("                                </a>\r\n");
      out.write("                            </li>-->\r\n");
      out.write("						</ul>\r\n");
      out.write("					</div>\r\n");
      out.write("				</div>\r\n");
      out.write("			</nav>\r\n");
      out.write("			<!-- End Navbar -->\r\n");
      out.write("			<div class=\"content\">\r\n");
      out.write("				<div class=\"container-fluid\">\r\n");
      out.write("					<div class=\"card\">\r\n");
      out.write("						<div class=\"card-header\">\r\n");
      out.write("							<h4 class=\"card-title\">Delete</h4>\r\n");
      out.write("							<p class=\"card-category\">\r\n");
      out.write("							<div class=\"container-lg pt-5\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("								<h2>Delete Data File</h2>\r\n");
      out.write("\r\n");
      out.write("								<div class=\"alert success\" id=\"x\" style=\"display: none;\">\r\n");
      out.write("									<span class=\"closebtn\">&times;</span> <strong>Success!</strong>\r\n");
      out.write("									Successfully Deleted\r\n");
      out.write("								</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("								<div class=\"col-md-3\"></div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("								<div class=\"row\">\r\n");
      out.write("									<div class=\"col-md-12\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("										<div class=\"container\">\r\n");
      out.write("		<form action=\"deletePage.jsp\"  method=\"post\">\r\n");
      out.write("		\r\n");
      out.write("			<div class=\"input-group\">\r\n");
      out.write("\r\n");
      out.write("				Select the Date<i\r\n");
      out.write("					class=\"glyphicon glyphicon-user\"></i> &nbsp;&nbsp;<input type=\"date\" name=\"day\"></input>\r\n");
      out.write("					\r\n");
      out.write("					\r\n");
      out.write("					\r\n");
      out.write("			 <input type=\"submit\" value=\"Delete\">\r\n");
      out.write("			 </div>\r\n");
      out.write("			<h8>or</h8>\r\n");
      out.write("			 <div class=\"input-group\">\r\n");
      out.write("\r\n");
      out.write("				Select the Month<i\r\n");
      out.write("							class=\"glyphicon glyphicon-user\"></i>&nbsp;&nbsp;<select\r\n");
      out.write("							name=\"month\" id=\"monthNumber1\">\r\n");
      out.write("							<option value=\"1\">January</option>\r\n");
      out.write("							<option value=\"2\">February</option>\r\n");
      out.write("							<option value=\"3\">March</option>\r\n");
      out.write("							<option value=\"4\">April</option>\r\n");
      out.write("							<option value=\"5\">May</option>\r\n");
      out.write("							<option value=\"6\">June</option>\r\n");
      out.write("							<option value=\"7\">July</option>\r\n");
      out.write("							<option value=\"8\">August</option>\r\n");
      out.write("							<option value=\"9\">September</option>\r\n");
      out.write("							<option value=\"10\">October</option>\r\n");
      out.write("							<option value=\"11\">November</option>\r\n");
      out.write("							<option value=\"12\">December</option>\r\n");
      out.write("						</select> &nbsp;&nbsp;&nbsp; \r\n");
      out.write("					\r\n");
      out.write("					\r\n");
      out.write("					\r\n");
      out.write("			 <input type=\"submit\" value=\"Delete\">\r\n");
      out.write("			 </div>\r\n");
      out.write("		</form>\r\n");
      out.write("</div>\r\n");
      out.write("	</div>\r\n");
      out.write("								</div>\r\n");
      out.write("							</div>\r\n");
      out.write("\r\n");
      out.write("						</div>\r\n");
      out.write("						\r\n");
      out.write("\r\n");
      out.write("					</div>\r\n");
      out.write("					<br>\r\n");
      out.write("\r\n");
      out.write("				</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("			</div>\r\n");
      out.write("			</p>\r\n");
      out.write("		</div>\r\n");

		//ArrayList<Account> accounts_1 = db.ViewDatabyDatePerMonthChart(monthNumber);
		
ArrayList<Account> _AccountDetails = new ArrayList<>();

		boolean isSuccess;
		Connection connection;
		Statement statement;
		ResultSet resultSet;
 
		String _date = request.getParameter("day");
	    String  monthNumber = request.getParameter("month");

		String[] months = { "January", "February", "March", "April", "May", "June", "July", "August", "Sepetember",
		"October", "November", "December" };

		String Month = null;
		Gson gsonObj = new Gson();
		Map<Object, Object> map = null;
		List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();
	
		System.out.println("dateeeee "+_date);
		
		String month = months[Integer.parseInt(monthNumber)];
		
		if(_date==null){
			_date="1999-01-01"	;	
			}
		
		
		try {

			// Call to the database connection
			connection = DBConnection.GetConnection();

			statement = connection.createStatement();

			// Declare the sql statement for retrieve all employee details
		//	String _Sql = "select * from  totalcountmonthlychart where Month= ' " + monthNumber + " ' order by  SumMsgCount desc LIMIT 20";
			String _Sql = "delete from  daily_sms_report.account where Date= '" + _date + "'";
					
					if(month != null){
			String _Sql1 = "delete from  daily_sms_report.account where Month(Date)= '" + month + "'";
					}
					String sql = "SELECT * FROM daily_sms_report.account where Date ='"+ _date+"'";


			
					//int _Rs = statement.executeUpdate(_Sql);
					int _Rs = statement.executeUpdate(_Sql);
					ResultSet _Rs1 = statement.executeQuery(sql);
					
					System.out.println(_Sql);
		//	System.out.println(_Rs1);
			
			if(_Rs1.next()){
				
				
				
				do{
					String name = _Rs1.getString(2);
					System.out.println(name);
				}while(_Rs1.next());
			}


			if (_Rs>0) {
				
				System.out.println("Successfully Deleted");

			}
			else{
				System.out.println("Not Successfully Deleted");
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

//	SMSdb db = new SMSdb();
	//ArrayList<Account> accounts = db.ViewDatabyMonthlyChart(monthNumber);
//		//ArrayList<Account> accounts = db.ViewDatabyMonthlyChart(monthNumber, year);

		
	
      out.write("\r\n");
      out.write("	\r\n");
      out.write("	\r\n");
      out.write("	\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("								\r\n");
      out.write("		<div class=\"card-body\">\r\n");
      out.write("			<div class=\"row\">\r\n");
      out.write("				<div class=\"col-md-6\"></div>\r\n");
      out.write("				<div class=\"col-md-6\"></div>\r\n");
      out.write("			</div>\r\n");
      out.write("			<br> <br>\r\n");
      out.write("			<div class=\"places-buttons\"></div>\r\n");
      out.write("			<!--   <div class=\"row\">\r\n");
      out.write("                                <div class=\"col-md-12 text-center\">\r\n");
      out.write("                                    <h4 class=\"title\">Modal</h4>\r\n");
      out.write("                                    <a class=\"btn btn-info btn-fill btn-wd\" data-toggle=\"modal\" data-target=\"#myModal1\" href=\"#pablo\">\r\n");
      out.write("                                        Launch Modal Mini\r\n");
      out.write("                                    </a>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>-->\r\n");
      out.write("		</div>\r\n");
      out.write("	</div>\r\n");
      out.write("	<!-- Mini Modal -->\r\n");
      out.write("	<div class=\"modal fade modal-mini modal-primary\" id=\"myModal1\"\r\n");
      out.write("		tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myModalLabel\"\r\n");
      out.write("		aria-hidden=\"true\">\r\n");
      out.write("		<div class=\"modal-dialog\">\r\n");
      out.write("			<div class=\"modal-content\">\r\n");
      out.write("				<div class=\"modal-header justify-content-center\">\r\n");
      out.write("					<div class=\"modal-profile\">\r\n");
      out.write("						<i class=\"nc-icon nc-bulb-63\"></i>\r\n");
      out.write("					</div>\r\n");
      out.write("				</div>\r\n");
      out.write("				<div class=\"modal-body text-center\">\r\n");
      out.write("					<p>Always have an access to your profile</p>\r\n");
      out.write("				</div>\r\n");
      out.write("				<div class=\"modal-footer\">\r\n");
      out.write("					<button type=\"button\" class=\"btn btn-link btn-simple\">Back</button>\r\n");
      out.write("					<button type=\"button\" class=\"btn btn-link btn-simple\"\r\n");
      out.write("						data-dismiss=\"modal\">Close</button>\r\n");
      out.write("				</div>\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("	</div>\r\n");
      out.write("	<!--  End Modal -->\r\n");
      out.write("	</div>\r\n");
      out.write("	</div>\r\n");
      out.write("	<footer class=\"footer\">\r\n");
      out.write("		<div class=\"container-fluid\">\r\n");
      out.write("			<nav>\r\n");
      out.write("				<!--  \\  <ul class=\"footer-menu\">\r\n");
      out.write("                            <li>\r\n");
      out.write("                                <a href=\"#\">\r\n");
      out.write("                                    Home\r\n");
      out.write("                                </a>\r\n");
      out.write("                            </li>\r\n");
      out.write("                            <li>\r\n");
      out.write("                                <a href=\"#\">\r\n");
      out.write("                                    Company\r\n");
      out.write("                                </a>\r\n");
      out.write("                            </li>\r\n");
      out.write("                            <li>\r\n");
      out.write("                                <a href=\"#\">\r\n");
      out.write("                                    Portfolio\r\n");
      out.write("                                </a>\r\n");
      out.write("                            </li>\r\n");
      out.write("                            <li>\r\n");
      out.write("                                <a href=\"#\">\r\n");
      out.write("                                    Blog\r\n");
      out.write("                                </a>\r\n");
      out.write("                            </li>\r\n");
      out.write("                        </ul>-->\r\n");
      out.write("				<p class=\"copyright text-center\">\r\n");
      out.write("					©\r\n");
      out.write("					<script>\r\n");
      out.write("						document.write(new Date().getFullYear())\r\n");
      out.write("					</script>\r\n");
      out.write("					mobiOs Private Limited All Rights Reserved\r\n");
      out.write("				</p>\r\n");
      out.write("			</nav>\r\n");
      out.write("		</div>\r\n");
      out.write("	</footer>\r\n");
      out.write("	</div>\r\n");
      out.write("	</div>\r\n");
      out.write("	<!--   -->\r\n");
      out.write("	<!-- <div class=\"fixed-plugin\">\r\n");
      out.write("    <div class=\"dropdown show-dropdown\">\r\n");
      out.write("        <a href=\"#\" data-toggle=\"dropdown\">\r\n");
      out.write("            <i class=\"fa fa-cog fa-2x\"> </i>\r\n");
      out.write("        </a>\r\n");
      out.write("\r\n");
      out.write("        <ul class=\"dropdown-menu\">\r\n");
      out.write("			<li class=\"header-title\"> Sidebar Style</li>\r\n");
      out.write("            <li class=\"adjustments-line\">\r\n");
      out.write("                <a href=\"javascript:void(0)\" class=\"switch-trigger\">\r\n");
      out.write("                    <p>Background Image</p>\r\n");
      out.write("                    <label class=\"switch\">\r\n");
      out.write("                        <input type=\"checkbox\" data-toggle=\"switch\" checked=\"\" data-on-color=\"primary\" data-off-color=\"primary\"><span class=\"toggle\"></span>\r\n");
      out.write("                    </label>\r\n");
      out.write("                    <div class=\"clearfix\"></div>\r\n");
      out.write("                </a>\r\n");
      out.write("            </li>\r\n");
      out.write("            <li class=\"adjustments-line\">\r\n");
      out.write("                <a href=\"javascript:void(0)\" class=\"switch-trigger background-color\">\r\n");
      out.write("                    <p>Filters</p>\r\n");
      out.write("                    <div class=\"pull-right\">\r\n");
      out.write("                        <span class=\"badge filter badge-black\" data-color=\"black\"></span>\r\n");
      out.write("                        <span class=\"badge filter badge-azure\" data-color=\"azure\"></span>\r\n");
      out.write("                        <span class=\"badge filter badge-green\" data-color=\"green\"></span>\r\n");
      out.write("                        <span class=\"badge filter badge-orange\" data-color=\"orange\"></span>\r\n");
      out.write("                        <span class=\"badge filter badge-red\" data-color=\"red\"></span>\r\n");
      out.write("                        <span class=\"badge filter badge-purple active\" data-color=\"purple\"></span>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"clearfix\"></div>\r\n");
      out.write("                </a>\r\n");
      out.write("            </li>\r\n");
      out.write("            <li class=\"header-title\">Sidebar Images</li>\r\n");
      out.write("\r\n");
      out.write("            <li class=\"active\">\r\n");
      out.write("                <a class=\"img-holder switch-trigger\" href=\"javascript:void(0)\">\r\n");
      out.write("                    <img src=\"../assets/img/sidebar-1.jpg\" alt=\"\" />\r\n");
      out.write("                </a>\r\n");
      out.write("            </li>\r\n");
      out.write("            <li>\r\n");
      out.write("                <a class=\"img-holder switch-trigger\" href=\"javascript:void(0)\">\r\n");
      out.write("                    <img src=\"../assets/img/sidebar-3.jpg\" alt=\"\" />\r\n");
      out.write("                </a>\r\n");
      out.write("            </li>\r\n");
      out.write("            <li>\r\n");
      out.write("                <a class=\"img-holder switch-trigger\" href=\"javascript:void(0)\">\r\n");
      out.write("                    <img src=\"..//assets/img/sidebar-4.jpg\" alt=\"\" />\r\n");
      out.write("                </a>\r\n");
      out.write("            </li>\r\n");
      out.write("            <li>\r\n");
      out.write("                <a class=\"img-holder switch-trigger\" href=\"javascript:void(0)\">\r\n");
      out.write("                    <img src=\"../assets/img/sidebar-5.jpg\" alt=\"\" />\r\n");
      out.write("                </a>\r\n");
      out.write("            </li>\r\n");
      out.write("\r\n");
      out.write("            <li class=\"button-container\">\r\n");
      out.write("                <div class=\"\">\r\n");
      out.write("                    <a href=\"http://www.creative-tim.com/product/light-bootstrap-dashboard\" target=\"_blank\" class=\"btn btn-info btn-block btn-fill\">Download, it's free!</a>\r\n");
      out.write("                </div>\r\n");
      out.write("            </li>\r\n");
      out.write("\r\n");
      out.write("            <li class=\"header-title pro-title text-center\">Want more components?</li>\r\n");
      out.write("\r\n");
      out.write("            <li class=\"button-container\">\r\n");
      out.write("                <div class=\"\">\r\n");
      out.write("                    <a href=\"http://www.creative-tim.com/product/light-bootstrap-dashboard-pro\" target=\"_blank\" class=\"btn btn-warning btn-block btn-fill\">Get The PRO Version!</a>\r\n");
      out.write("                </div>\r\n");
      out.write("            </li>\r\n");
      out.write("\r\n");
      out.write("            <li class=\"header-title\" id=\"sharrreTitle\">Thank you for sharing!</li>\r\n");
      out.write("\r\n");
      out.write("            <li class=\"button-container\">\r\n");
      out.write("				<button id=\"twitter\" class=\"btn btn-social btn-outline btn-twitter btn-round sharrre\"><i class=\"fa fa-twitter\"></i> · 256</button>\r\n");
      out.write("                <button id=\"facebook\" class=\"btn btn-social btn-outline btn-facebook btn-round sharrre\"><i class=\"fa fa-facebook-square\"></i> · 426</button>\r\n");
      out.write("            </li>\r\n");
      out.write("        </ul>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write(" -->\r\n");
      out.write("</body>\r\n");
      out.write("<!--   Core JS Files   -->\r\n");
      out.write("<script src=\"./assets/js/core/jquery.3.2.1.min.js\"\r\n");
      out.write("	type=\"text/javascript\"></script>\r\n");
      out.write("<script src=\"./assets/js/core/popper.min.js\" type=\"text/javascript\"></script>\r\n");
      out.write("<script src=\"./assets/js/core/bootstrap.min.js\" type=\"text/javascript\"></script>\r\n");
      out.write("<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->\r\n");
      out.write("<script src=\"./assets/js/plugins/bootstrap-switch.js\"></script>\r\n");
      out.write("<!--  Google Maps Plugin    -->\r\n");
      out.write("<script type=\"text/javascript\"\r\n");
      out.write("	src=\"https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE\"></script>\r\n");
      out.write("<!--  Chartist Plugin  -->\r\n");
      out.write("<script src=\"./assets/js/plugins/chartist.min.js\"></script>\r\n");
      out.write("<!--  Notifications Plugin    -->\r\n");
      out.write("<script src=\"./assets/js/plugins/bootstrap-notify.js\"></script>\r\n");
      out.write("<!-- Control Center for Light Bootstrap Dashboard: scripts for the example pages etc -->\r\n");
      out.write("<script src=\"./assets/js/light-bootstrap-dashboard.js?v=2.0.0 \"\r\n");
      out.write("	type=\"text/javascript\"></script>\r\n");
      out.write("<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->\r\n");
      out.write("<script src=\"./assets/js/demo.js\"></script>\r\n");
      out.write("\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

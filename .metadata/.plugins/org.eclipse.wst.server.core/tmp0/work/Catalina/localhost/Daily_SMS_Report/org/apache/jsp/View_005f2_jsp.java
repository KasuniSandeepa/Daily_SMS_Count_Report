/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.46
 * Generated at: 2021-09-07 05:34:21 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class View_005f2_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1614843924000L));
    _jspx_dependants.put("jar:file:/D:/D/Coding%20Projects/Eclipse%20Workspace/Dialy_SMS_Count_Report/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Daily_SMS_Report/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153365282000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody;

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
    _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.release();
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.release();
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"utf-8\" />\r\n");
      out.write("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("\r\n");
      out.write("<link rel=\"apple-touch-icon\" sizes=\"76x76\"\r\n");
      out.write("	href=\"./assets/img/apple-icon.png\">\r\n");
      out.write("<link rel=\"icon\" type=\"image/png\" href=\"./assets/img/favicon.ico\">\r\n");
      out.write("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\" />\r\n");
      out.write("<title>Daily Table Report | Daily SMS Report</title>\r\n");
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
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\"\r\n");
      out.write("	href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css\"\r\n");
      out.write("	integrity=\"sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS\"\r\n");
      out.write("	crossorigin=\"anonymous\">\r\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\"\r\n");
      out.write("	integrity=\"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo\"\r\n");
      out.write("	crossorigin=\"anonymous\"></script>\r\n");
      out.write("<script\r\n");
      out.write("	src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js\"\r\n");
      out.write("	integrity=\"sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut\"\r\n");
      out.write("	crossorigin=\"anonymous\"></script>\r\n");
      out.write("<script\r\n");
      out.write("	src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js\"\r\n");
      out.write("	integrity=\"sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k\"\r\n");
      out.write("	crossorigin=\"anonymous\"></script>\r\n");
      out.write("\r\n");
      out.write("<script src=\"http://code.jquery.com/jquery-3.3.1.min.js\"\r\n");
      out.write("	integrity=\"sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=\"\r\n");
      out.write("	crossorigin=\"anonymous\"></script>\r\n");
      out.write("<link rel=\"stylesheet\"\r\n");
      out.write("	href=\"https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css\">\r\n");
      out.write("<script\r\n");
      out.write("	src=\"https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js\"></script>\r\n");
      out.write("<style>\r\n");
      out.write(".l {\r\n");
      out.write("	float: left;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".u {\r\n");
      out.write("	list-style-type: none;\r\n");
      out.write("	margin: 0;\r\n");
      out.write("	padding: 0;\r\n");
      out.write("	overflow: hidden;\r\n");
      out.write("	background-color: #333;\r\n");
      out.write("	width: 100%;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("li a {\r\n");
      out.write("	display: block;\r\n");
      out.write("	color: white;\r\n");
      out.write("	text-align: center;\r\n");
      out.write("	padding: 12px 14px;\r\n");
      out.write("	text-decoration: none;\r\n");
      out.write("	width: 100%;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("li a:hover {\r\n");
      out.write("	background-color: #111;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#active {\r\n");
      out.write("	background-color: #FF4D4D;\r\n");
      out.write("	height: 43px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("th, td {\r\n");
      out.write("	font-size: 14px;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
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
      out.write("					<li class=\"nav-item active\"><a class=\"nav-link\"\r\n");
      out.write("						href=\"ViewSummaryByMonth.jsp\"> <i class=\"nc-icon nc-notes\"></i>\r\n");
      out.write("							<p>Table List</p>\r\n");
      out.write("					</a></li>\r\n");
      out.write("					<li><a class=\"nav-link\" href=\"MainCharts.jsp\"> <i\r\n");
      out.write("							class=\"nc-icon nc-paper-2\"></i>\r\n");
      out.write("							<p>View Charts</p>\r\n");
      out.write("					</a></li>\r\n");
      out.write("					<li><a class=\"nav-link\" href=\"upload.jsp\"> <i\r\n");
      out.write("							class=\"nc-icon nc-atom\"></i>\r\n");
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
      out.write("					<a class=\"navbar-brand\" href=\"#pablo\"> Table Report - Per Date</a>\r\n");
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
      out.write("			<br>\r\n");
      out.write("			<div class=\"container\">\r\n");
      out.write("				<ul class=\"nav nav-tabs\" role=\"tablist\">\r\n");
      out.write("					<li class=\"nav-item\"><a\r\n");
      out.write("						class=\"nav-link {{request () -> is('ViewSummaryByMonth.jsp') ? 'active' : null }}\"\r\n");
      out.write("						href=\"ViewSummaryByMonth.jsp\" role=\"tab\" style=\"color: #808080\">View\r\n");
      out.write("							Summary By Month</a></li>\r\n");
      out.write("					<li class=\"nav-item\"><a\r\n");
      out.write("						class=\"nav-link active {{request () -> is('View_2.jsp') ? 'active' : null }}\"\r\n");
      out.write("						href=\"View_2.jsp\" role=\"tab\" style=\"color: #808080\">View\r\n");
      out.write("							Summary By Date</a></li>\r\n");
      out.write("\r\n");
      out.write("					<li class=\"nav-item\"><a\r\n");
      out.write("						class=\"nav-link   {{request () -> is('test7_7.1.jsp') ? 'active' : null }}\"\r\n");
      out.write("						href=\"test7_7.1.jsp\" role=\"tab\" style=\"color: #808080\">Overall\r\n");
      out.write("							View</a></li>\r\n");
      out.write("\r\n");
      out.write("				</ul>\r\n");
      out.write("				<!-- Tab panes -->\r\n");
      out.write("				<div class=\"tab-content\">\r\n");
      out.write("					<div\r\n");
      out.write("						class=\"tab-pane {{request() ->is('ViewSummaryByMonth.jsp') ? 'active' : null }}\"\r\n");
      out.write("						id=\"{{url('ViewSummaryByMonth.jsp')}}\" role=\"tabpanel\">\r\n");
      out.write("						<p>View Summary By Month</p>\r\n");
      out.write("					</div>\r\n");
      out.write("					<div\r\n");
      out.write("						class=\"tab-pane {{request() ->is('View_2.jsp') ? 'active' : null }}\"\r\n");
      out.write("						id=\"{{url('View_2.jsp')}}\" role=\"tabpanel\">\r\n");
      out.write("						<p>View Summary By Date</p>\r\n");
      out.write("					</div>\r\n");
      out.write("\r\n");
      out.write("					<div\r\n");
      out.write("						class=\"tab-pane {{request() ->is('test7_7.1.jsp') ? 'active' : null }}\"\r\n");
      out.write("						id=\"{{url('test7_7.1.jsp')}}\" role=\"tabpanel\">\r\n");
      out.write("						<p>Overall View</p>\r\n");
      out.write("					</div>\r\n");
      out.write("\r\n");
      out.write("				</div>\r\n");
      out.write("			</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("			<br>\r\n");
      out.write("\r\n");
      out.write("			<div class=\"container\">\r\n");
      out.write("				<div class=\"text-center\"></div>\r\n");
      out.write("\r\n");
      out.write("				<form action=\"Controller/view_controller2.jsp\" name=\"add\"\r\n");
      out.write("					method=\"post\">\r\n");
      out.write("					<div class=\"input-group\">\r\n");
      out.write("						Select the Date<i class=\"glyphicon glyphicon-user\"></i>\r\n");
      out.write("						&nbsp;&nbsp; <input type=\"date\" name=\"date\">\r\n");
      out.write("\r\n");
      out.write("						&nbsp;&nbsp;&nbsp; <input type=\"submit\" value=\"View\"\r\n");
      out.write("							style=\"background-color: #008CBA; padding: 6px 14px; border-radius: 4px; color: white;\" />\r\n");
      out.write("				</form>\r\n");
      out.write("\r\n");
      out.write("				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n");
      out.write("				<!--  <a href=\"ChartbyDate.jsp\"><input type=\"button\" class=\"btn btn-warning\"\r\n");
      out.write("							value=\"View Chart\"></a>-->\r\n");
      out.write("			</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("			<br>\r\n");
      out.write("			");

				String rs = (String) application.getAttribute("date");
			
      out.write("\r\n");
      out.write("\r\n");
      out.write("			<h4>\r\n");
      out.write("				Date\r\n");
      out.write("				");

				if (rs == null) {
				
				
			} else {
				out.println(rs);
			}
			
      out.write("\r\n");
      out.write("			</h4>\r\n");
      out.write("\r\n");
      out.write("			<table class=\"table table-fluid\" id=\"myTable\">\r\n");
      out.write("				<thead>\r\n");
      out.write("\r\n");
      out.write("					<tr>\r\n");
      out.write("\r\n");
      out.write("						<th>Account Name</th>\r\n");
      out.write("\r\n");
      out.write("						<th>Message Count</th>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("					</tr>\r\n");
      out.write("				</thead>\r\n");
      out.write("				<tbody>\r\n");
      out.write("\r\n");
      out.write("					");
      if (_jspx_meth_c_005fforEach_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\r\n");
      out.write("				</tbody>\r\n");
      out.write("			</table>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("			<br> <br>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("		</div>\r\n");
      out.write("	</div>\r\n");
      out.write("	</div>\r\n");
      out.write("\r\n");
      out.write("	</div>\r\n");
      out.write("	<script>\r\n");
      out.write("		$(document).ready(function() {\r\n");
      out.write("			$('#myTable').DataTable({\r\n");
      out.write("				\"order\" : [ [ 1, \"desc\" ] ]\r\n");
      out.write("			});\r\n");
      out.write("		});\r\n");
      out.write("\r\n");
      out.write("		$(document).ready(\r\n");
      out.write("				function() {\r\n");
      out.write("					$(\"td.contribution\").each(\r\n");
      out.write("							function() {\r\n");
      out.write("								$(this).html(\r\n");
      out.write("										parseFloat($(this).text())\r\n");
      out.write("												.toLocaleString('en-US', {\r\n");
      out.write("													maximumFractionDigits : 2\r\n");
      out.write("												}));\r\n");
      out.write("							})\r\n");
      out.write("				})\r\n");
      out.write("	</script>\r\n");
      out.write("\r\n");
      out.write("	<script src=\"text/javascript\">\r\n");
      out.write("		function getDaysInMonthUTC(month) {\r\n");
      out.write("			console.log('Month : ' + month);\r\n");
      out.write("			var date = new Date(Date.UTC(2021, month, 1));\r\n");
      out.write("			var days = [];\r\n");
      out.write("			while (date.getUTCMonth() === month) {\r\n");
      out.write("				days.push(new Date(date));\r\n");
      out.write("				date.setUTCDate(date.getUTCDate() + 1);\r\n");
      out.write("			}\r\n");
      out.write("			return days;\r\n");
      out.write("		}\r\n");
      out.write("	</script>\r\n");
      out.write("\r\n");
      out.write("	<br>\r\n");
      out.write("	<br>\r\n");
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
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
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

  private boolean _jspx_meth_c_005fforEach_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_005fforEach_005f0 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    boolean _jspx_th_c_005fforEach_005f0_reused = false;
    try {
      _jspx_th_c_005fforEach_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fforEach_005f0.setParent(null);
      // /View_2.jsp(354,5) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fforEach_005f0.setVar("account");
      // /View_2.jsp(354,5) name = items type = javax.el.ValueExpression reqTime = true required = false fragment = false deferredValue = true expectedTypeName = java.lang.Object deferredMethod = false methodSignature = null
      _jspx_th_c_005fforEach_005f0.setItems(new org.apache.jasper.el.JspValueExpression("/View_2.jsp(354,5) '${accounts}'",_jsp_getExpressionFactory().createValueExpression(_jspx_page_context.getELContext(),"${accounts}",java.lang.Object.class)).getValue(_jspx_page_context.getELContext()));
      int[] _jspx_push_body_count_c_005fforEach_005f0 = new int[] { 0 };
      try {
        int _jspx_eval_c_005fforEach_005f0 = _jspx_th_c_005fforEach_005f0.doStartTag();
        if (_jspx_eval_c_005fforEach_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
          do {
            out.write("\r\n");
            out.write("\r\n");
            out.write("						");
            if (_jspx_meth_c_005fset_005f0(_jspx_th_c_005fforEach_005f0, _jspx_page_context, _jspx_push_body_count_c_005fforEach_005f0))
              return true;
            out.write("\r\n");
            out.write("						");
            if (_jspx_meth_c_005fset_005f1(_jspx_th_c_005fforEach_005f0, _jspx_page_context, _jspx_push_body_count_c_005fforEach_005f0))
              return true;
            out.write("\r\n");
            out.write("\r\n");
            out.write("\r\n");
            out.write("\r\n");
            out.write("\r\n");
            out.write("						<tr>\r\n");
            out.write("							<td>");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${account.getAccountName()}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("</td>\r\n");
            out.write("							<td class=\"contribution\">");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${account.getMsgCount()}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("</td>\r\n");
            out.write("\r\n");
            out.write("\r\n");
            out.write("\r\n");
            out.write("\r\n");
            out.write("						</tr>\r\n");
            out.write("					");
            int evalDoAfterBody = _jspx_th_c_005fforEach_005f0.doAfterBody();
            if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
              break;
          } while (true);
        }
        if (_jspx_th_c_005fforEach_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
          return true;
        }
      } catch (java.lang.Throwable _jspx_exception) {
        while (_jspx_push_body_count_c_005fforEach_005f0[0]-- > 0)
          out = _jspx_page_context.popBody();
        _jspx_th_c_005fforEach_005f0.doCatch(_jspx_exception);
      } finally {
        _jspx_th_c_005fforEach_005f0.doFinally();
      }
      _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.reuse(_jspx_th_c_005fforEach_005f0);
      _jspx_th_c_005fforEach_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fforEach_005f0, _jsp_getInstanceManager(), _jspx_th_c_005fforEach_005f0_reused);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fset_005f0(javax.servlet.jsp.tagext.JspTag _jspx_th_c_005fforEach_005f0, javax.servlet.jsp.PageContext _jspx_page_context, int[] _jspx_push_body_count_c_005fforEach_005f0)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:set
    org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_005fset_005f0 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
    boolean _jspx_th_c_005fset_005f0_reused = false;
    try {
      _jspx_th_c_005fset_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fset_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_005fforEach_005f0);
      // /View_2.jsp(356,6) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f0.setVar("accountName");
      // /View_2.jsp(356,6) name = value type = javax.el.ValueExpression reqTime = true required = false fragment = false deferredValue = true expectedTypeName = java.lang.Object deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f0.setValue(new org.apache.jasper.el.JspValueExpression("/View_2.jsp(356,6) '${account.getAccountName()}'",_jsp_getExpressionFactory().createValueExpression(_jspx_page_context.getELContext(),"${account.getAccountName()}",java.lang.Object.class)).getValue(_jspx_page_context.getELContext()));
      int _jspx_eval_c_005fset_005f0 = _jspx_th_c_005fset_005f0.doStartTag();
      if (_jspx_th_c_005fset_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f0);
      _jspx_th_c_005fset_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fset_005f0, _jsp_getInstanceManager(), _jspx_th_c_005fset_005f0_reused);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fset_005f1(javax.servlet.jsp.tagext.JspTag _jspx_th_c_005fforEach_005f0, javax.servlet.jsp.PageContext _jspx_page_context, int[] _jspx_push_body_count_c_005fforEach_005f0)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:set
    org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_005fset_005f1 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
    boolean _jspx_th_c_005fset_005f1_reused = false;
    try {
      _jspx_th_c_005fset_005f1.setPageContext(_jspx_page_context);
      _jspx_th_c_005fset_005f1.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_005fforEach_005f0);
      // /View_2.jsp(357,6) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f1.setVar("messageCount");
      // /View_2.jsp(357,6) name = value type = javax.el.ValueExpression reqTime = true required = false fragment = false deferredValue = true expectedTypeName = java.lang.Object deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f1.setValue(new org.apache.jasper.el.JspValueExpression("/View_2.jsp(357,6) '${account.getMsgCount()}'",_jsp_getExpressionFactory().createValueExpression(_jspx_page_context.getELContext(),"${account.getMsgCount()}",java.lang.Object.class)).getValue(_jspx_page_context.getELContext()));
      int _jspx_eval_c_005fset_005f1 = _jspx_th_c_005fset_005f1.doStartTag();
      if (_jspx_th_c_005fset_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f1);
      _jspx_th_c_005fset_005f1_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fset_005f1, _jsp_getInstanceManager(), _jspx_th_c_005fset_005f1_reused);
    }
    return false;
  }
}

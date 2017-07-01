<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="com.ttonway.bluecard.pojo.AdminUserDetails" %>
<%@ page import="com.ttonway.bluecard.util.AuthorityUtils" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="com.ttonway.bluecard.pojo.AdminUser" %>
<%
    AdminUserDetails userDetails = (AdminUserDetails) SecurityContextHolder.getContext()
        .getAuthentication()
        .getPrincipal();
    AdminUser adminUser = userDetails.getAdminUser();

    String uri = request.getRequestURI();
    int start = uri.lastIndexOf("/");
    int end = uri.indexOf(".", start + 1);
    if (start != -1 && end != -1 && end > start + 1) {
        uri = uri.substring(start + 1, end);
    }
%>
<!-- Main Header -->
<header class="main-header">

    <!-- Logo -->
    <a href="#" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>邮储</b></span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>信用卡申请</b>管理系统</span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>
        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">

                <!-- User Account Menu -->
                <li class="dropdown user user-menu">
                    <!-- Menu Toggle Button -->
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <!-- hidden-xs hides the username on small devices so only the image appears. -->
                        <span class="hidden-xs"><%= adminUser.getName() %></span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- The user image in the menu -->
                        <li class="user-header">
                            <img src="<%=request.getContextPath()%>/static/lib/adminLTE/img/avatar5.png" class="img-circle"
                                 alt="User Image">
                            <p>
                                <%= adminUser.getName() %> - <%= adminUser.getRoleName() %>
                                <small><%= adminUser.getBank() == null ? "" : adminUser.getBank().getBankName() %>
                                </small>
                            </p>
                        </li>
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-left">
                                <a href="#" class="btn btn-default" id="reset-pwd-btn">修改密码</a>
                            </div>
                            <div class="pull-right">
                                <a href="<%=request.getContextPath()%>/j_spring_security_logout" class="btn btn-default">注销</a>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>
<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

        <!-- Sidebar Menu -->
        <ul class="sidebar-menu">
            <li class="header"><img src="<%=request.getContextPath()%>/static/images/logo1.png"/></li>
            <!-- Optionally, you can add icons to the links -->
            <% if (AuthorityUtils.hasAuthority(userDetails, "ROLE_ADMIN")) { %>
            <li<% if (uri.equals("userlist") || uri.equals("usercreate")) { %> class="active"<% } %>><a href="<%=request.getContextPath()%>/admin/table"><i class="fa fa-link"></i> <span>帐号信息</span></a></li>
            <li<% if (uri.equals("orglist") || uri.equals("orgcreate")) { %> class="active"<% } %>><a href="<%=request.getContextPath()%>/org/table"><i class="fa fa-link"></i> <span>推荐机构</span></a></li>
            <li<% if (uri.equals("linkgrid") || uri.equals("linkcreate")) { %> class="active"<% } %>><a href="<%=request.getContextPath()%>/link/table"><i class="fa fa-link"></i> <span>活动内容</span></a></li>
            <% } %>
        </ul>
        <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
</aside>


<div class="modal fade" id="reset-pwd-modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">修改密码</h4>
            </div>
            <div class="modal-body">
                <div class="alert alert-success" role="alert"></div>
                <div class="alert alert-danger" role="alert"></div>
                <p>确认修改密码吗？</p>
                <form class="form-horizontal" action="<%=request.getContextPath()%>/admin/resetPwd">
                    <div class="form-group">
                        <label for="new-password" class="col-sm-2 control-label">密码：</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new-password">
                        </div>
                    </div>
                    <input type="hidden" id="user-id" value="<%= adminUser.getUserId() %>">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">确认</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
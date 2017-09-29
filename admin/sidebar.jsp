<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Properties"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lakhi.realestate.dbconfig.propertyConfig"%>
<%
Properties prop = propertyConfig.getLangProperties(request,response);
%>
<div data-scrollable>
   <ul class="sidebar-menu sm-icons-block sm-icons-right sm-active-item-bg">
     <li ng-class="{ 'active': $state.is('admin.dashboard') }"><a ui-sref="admin.dashboard"><i class="fa fa-tachometer"></i><span><%=prop.getProperty("dashboard")%></span></a></li>
     <li ng-click="vendors()" ng-class="{ 'active': $state.is('admin.vendorList') }"><a ui-sref="admin.vendorList"><i class="fa fa-search"></i><span><%=prop.getProperty("vendors")%></span></a></li>
     <li ng-class="{ 'active': $state.is('admin.hotels') }"><a ui-sref="admin.hotels"><i class="fa fa-home"></i><span><%=prop.getProperty("hotels")%></span></a></li>
     <li ng-click="importHotels()" ng-class="{ 'active': $state.is('admin.importHotels') }"><a ui-sref="admin.importHotels"><i class="fa fa-download"></i><span><%=prop.getProperty("exportHotels")%></span></a></li>
     <li ng-class="{ 'active': $state.is('admin.about') }"><a ui-sref="admin.about"><i class="fa fa-cog"></i><span><%=prop.getProperty("about")%></span></a></li>
     <li ng-class="{ 'active': $state.is('admin.privacy') }"><a ui-sref="admin.privacy"><i class="fa fa-cog"></i><span><%=prop.getProperty("privacy")%></span></a></li>
     <li ng-class="{ 'active': $state.is('admin.terms') }"><a ui-sref="admin.terms"><i class="fa fa-cog"></i><span><%=prop.getProperty("terms")%></span></a></li>
     <li ng-class="{ 'active': $state.is('admin.listContactUs') }"><a ui-sref="admin.listContactUs"><i class="fa fa-list"></i><span><%=prop.getProperty("listContactUs")%></span></a></li>
     <li ng-class="{ 'active': $state.is('admin.services') }"><a ui-sref="admin.services"><i class="fa fa-list"></i><span><%=prop.getProperty("service")%></span></a></li>
   </ul>
</div>
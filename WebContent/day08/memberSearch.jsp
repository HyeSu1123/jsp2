<%@page import="hrd.vo.Member"%>
<%@page import="java.util.List"%>
<%@page import="hrd.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String column = request.getParameter("column");
	String[] finds = request.getParameterValues("find");
	String find = finds[0];
	if(column.equals("grade")) find = finds[1];	//고객등급 검색일때만
	
	MemberDao dao = MemberDao.getInstance();
	List<Member> list = dao.search(column,find);
	
	request.setAttribute("column", column);
	request.setAttribute("find", find);
	request.setAttribute("list", list);
	pageContext.forward("4_memberlist.jsp");


%>
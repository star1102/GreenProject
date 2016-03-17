<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml;charset=UTF-8"
         pageEncoding="UTF-8"
         import = "db.*"
         import = "java.util.*"%>
<%
	String strPage = request.getParameter("page");
	int intPage = 1;
	if(strPage != null) intPage = Integer.parseInt(strPage);
	MusicDBBean dbBean = MusicDBBean.getInstance();
	int totalCount = dbBean.getMP3Count();
	ArrayList<MusicDataBean> list = dbBean.getMP3List(intPage, 5);
		
%>      
<mp3>
	<%
	if(list != null){
	for(MusicDataBean dataBean : list){
		//dataBean = list.get(i);
		//System.out.println(list.get(i));
		%>	
		<record>
			<singer_name><%=dataBean.getSinger_name() %></singer_name>
			<song_name><%=dataBean.getSong_name() %></song_name>
			<file_name><%=dataBean.getFile_name() %></file_name>
			<upload_date><%=dataBean.getUpload_date() %></upload_date>
		</record>

	<%
		}
	}
	%>	
</mp3>
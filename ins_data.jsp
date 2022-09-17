<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<%@ page import="java.net.*" %>
<%@ page import="java.io.*" %>
<%
	String SEND_URL = "http://keep_api.beta.so/sod2208/ins_data";
	String SEND_MSG = "";
	
	request.setCharacterEncoding("utf-8");	
	//SEND_MSG = "{ \"NICK_NM\":\"±èÁÖÈ­\", \"STG1_SCORE\":\"219\", \"STG2_SCORE\":\"438\", \"STG3_SCORE\":\"657\", \"STG4_SCORE\":\"877\", \"STG1_DT\":\"2022-07-30 07:15:20\", \"STG2_DT\":\"2022-07-30 07:15:40\", \"STG3_DT\":\"2022-07-30 07:16:10\", \"STG4_DT\":\"2022-07-30 07:17:25\" }";
	SEND_MSG = request.getParameter("data");
	
	try {
		URL url = new URL(SEND_URL);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setConnectTimeout(5000);
		con.setReadTimeout(5000);
		con.setRequestMethod("POST");
		
		con.setRequestProperty("Access-Control-Allow-Origin", "*");
		con.setRequestProperty("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
		con.setRequestProperty("Access-Control-Allow-Headers", "*");
		con.setRequestProperty("Access-Control-Max-Age", "86400");
		con.setRequestProperty("Access-Control-Allow-Credentials", "true");
		
		con.setDoInput(true);
		con.setDoOutput(true);
		con.setUseCaches(false);
		con.setDefaultUseCaches(false);

		StringBuffer sbf = new StringBuffer();
		sbf.append("data").append("=").append(SEND_MSG);
		
		PrintWriter pw = new PrintWriter(new OutputStreamWriter(con.getOutputStream(), "UTF-8"));
		pw.write(sbf.toString());
		pw.flush();
		
		StringBuilder sb = new StringBuilder();
		if ( con.getResponseCode() == HttpURLConnection.HTTP_OK ){
			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			String line;
			while ((line = br.readLine()) != null ){
				sb.append(line).append("\n");
			}
			br.close();
			out.println(""+ sb.toString());
		} else {
			out.println(con.getResponseMessage());
		}
	} catch (Exception e){		
		out.println(""+ e.toString());
		System.err.println(e.toString());
	}
%>
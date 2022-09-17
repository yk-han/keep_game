<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<%@ page import="java.net.*" %>
<%@ page import="java.io.*" %>
<%
	String SEND_URL = "http://keep_api.beta.so/sod2208/rank_list";
	
	try {
		URL url = new URL(SEND_URL);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setConnectTimeout(5000);
		con.setReadTimeout(5000);
		con.setRequestMethod("GET");
		
		con.setRequestProperty("Content-Type", "application/json");	
		con.setRequestProperty("Access-Control-Allow-Origin", "*");
		con.setRequestProperty("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
		con.setRequestProperty("Access-Control-Allow-Headers", "*");
		con.setRequestProperty("Access-Control-Max-Age", "86400");
		con.setRequestProperty("Access-Control-Allow-Credentials", "true");

		con.setDoInput(true);
		con.setDoOutput(true);
		con.setUseCaches(false);
		con.setDefaultUseCaches(false);
		
		OutputStreamWriter wr = new OutputStreamWriter(con.getOutputStream());
		wr.write("");
		wr.flush();
		
		StringBuilder sb = new StringBuilder();
		if ( con.getResponseCode() == HttpURLConnection.HTTP_OK ){
			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			String line;
			while ((line = br.readLine()) != null ){
				sb.append(line).append("\n");
			}
			br.close();
			out.println(""+ sb.toString());
		}
	} catch (Exception e){		
		System.err.println(e.toString());
	}
%>
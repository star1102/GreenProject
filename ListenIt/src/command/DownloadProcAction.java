package command;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DownloadProcAction implements CommandAction {

	@Override
	public ForwardAction process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		req.setCharacterEncoding("UTF-8");
		// 가수,곡 이름 가져오기
		String singer_name = req.getParameter("singer_name");
		String song_name = req.getParameter("song_name");
		 
	    // 파일 업로드된 경로
	    String savePath = "D:\\music\\";
	 
	    // 서버에 실제 저장된 파일명
	    String file_name = req.getParameter("file_name");
	     
	    // 실제 내보낼 파일명
	    String orgfilename = singer_name + " - " + song_name + file_name.substring(file_name.lastIndexOf("."));
	      
	 
	    InputStream in = null;
	    OutputStream os = null;
	    File file = null;
	    boolean skip = false;
	    String client = "";
	 
	 
	    try{
	         
	 
	        // 파일을 읽어 스트림에 담기
	        try{
	            file = new File(savePath, file_name);
	            in = new FileInputStream(file);
	        }catch(FileNotFoundException fe){
	            skip = true;
	        }
	         
	        client = req.getHeader("User-Agent");
	 
	        // 파일 다운로드 헤더 지정
	        res.reset() ;
	        res.setContentType("application/octet-stream");
	        res.setHeader("Content-Description", "JSP Generated Data");
	 
	 
	        if(!skip){
	             
	            // IE
	            if(client.indexOf("MSIE") != -1){
	            	res.setHeader ("Content-Disposition", "attachment; filename="+new String(orgfilename.getBytes("KSC5601"),"ISO8859_1"));
	 
	            }else{
	                // 한글 파일명 처리
	                orgfilename = new String(orgfilename.getBytes("utf-8"),"iso-8859-1");
	 
	                res.setHeader("Content-Disposition", "attachment; filename=\"" + orgfilename + "\"");
	                res.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
	            }  
	             
	            res.setHeader ("Content-Length", ""+file.length() );
	 
	 
	       
	            os = res.getOutputStream();
	            byte b[] = new byte[(int)file.length()];
	            int leng = 0;
	             
	            while( (leng = in.read(b)) > 0 ){
	                os.write(b,0,leng);
	            }
	 
	        }else{
	        	res.setContentType("text/html;charset=UTF-8");
	            System.out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");
	 
	        }
	         
	        in.close();
	        os.close();
	 
	    }catch(Exception e){
	      e.printStackTrace();
	    }
		

		return null;
	}
}

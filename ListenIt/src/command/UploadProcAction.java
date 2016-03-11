package command;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import db.MusicDBBean;
import db.MusicDataBean;

public class UploadProcAction implements CommandAction {
   
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		//저장 경로
		String path = "D:\\music\\";
		// 업로드 파일명
	    String uploadFile = "";
	    // 실제 저장할 파일명
	    String newFileName = "";
	    int read = 0;
	    byte[] buf = new byte[1024];
	    FileInputStream fin = null;
	    FileOutputStream fout = null;
	    long currentTime = System.currentTimeMillis();  
	    SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss"); 
	    
		MultipartRequest multi = new MultipartRequest(req, path , 1024*1024*10 , "UTF-8", new DefaultFileRenamePolicy()); //new DefaultFileRenamePolicy()
		
		String singer_name = multi.getParameter("singer_name");
		String song_name = multi.getParameter("song_name");
		
		// 파일업로드
        uploadFile = multi.getOriginalFileName("uploadFile"); //multi.getFilesystemName("uploadFile");
 		
        // 실제 저장할 파일명(ex : 20140819151221.zip)
        //newFileName = simDf.format(new Date(currentTime)) +"."+ uploadFile.substring(uploadFile.lastIndexOf(".")+1);
 		String subVal = multi.getFilesystemName("uploadFile");
 		newFileName = subVal.substring(0 , subVal.lastIndexOf(".")) + " " + simDf.format(new Date(currentTime)) + ".mp3";
 		
         
        // 업로드된 파일 객체 생성
        File oldFile = new File(path + uploadFile);
         
        // 실제 저장될 파일 객체 생성
        File newFile = new File(path + newFileName);
 
        // 파일명 rename
        if(!oldFile.renameTo(newFile)){
 
            // rename이 되지 않을경우 강제로 파일을 복사하고 기존파일은 삭제
 
            buf = new byte[1024];
            fin = new FileInputStream(oldFile);
            fout = new FileOutputStream(newFile);
            read = 0;
            while((read=fin.read(buf,0,buf.length))!=-1){
                fout.write(buf, 0, read);
            }
             
            fin.close();
            fout.close();
            oldFile.delete();
        }
		
		MusicDataBean bean = new MusicDataBean();
		
		bean.setSinger_name(singer_name);
		bean.setSong_name(song_name);
		bean.setFile_name(uploadFile);
		bean.setUpload_name(newFileName);
		
		MusicDBBean DB = MusicDBBean.getInstance();
		DB.insertMP3(bean);
		
/* ------------------------------------------------------------- */
		
		String strPage = req.getParameter("page");
		int intPage = 1;
		if(strPage != null) intPage = Integer.parseInt(strPage);
		MusicDBBean dbBean = MusicDBBean.getInstance();
		int totalCount = dbBean.getMP3Count();
		ArrayList<MusicDataBean> list = dbBean.getMP3List(intPage, 5);
		
		//페이지 계산
		int startPage = 1;
		int endPage = totalCount /5;
		endPage += (totalCount % 5 == 0 ? 0 : 1);
		
		//req.setAttribute("page", intPage);
		req.setAttribute("total", totalCount);
		req.setAttribute("list", list);
		//req.setAttribute("start", startPage);
		//req.setAttribute("end", endPage);
		
		return "/index_station.jsp";
	}

}

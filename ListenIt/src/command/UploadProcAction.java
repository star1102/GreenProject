package command;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;

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
	    // 실제 저장할 파일명
	    String newFileName = "";
	    MusicDataBean bean = new MusicDataBean();
		MusicDBBean DB = MusicDBBean.getInstance();
	    int read = 0;
	    byte[] buf = new byte[1024];
	    FileInputStream fin = null;
	    FileOutputStream fout = null;
	    long currentTime = System.currentTimeMillis();  
	    SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss"); 
		MultipartRequest multi = new MultipartRequest(req, path , 1024*1024*100 , "UTF-8", new DefaultFileRenamePolicy()); //new DefaultFileRenamePolicy()
		
		String[] singer_names = multi.getParameterValues("singer_name");
		String[] song_names = multi.getParameterValues("song_name");

		ArrayList<String> fileNames = new ArrayList<String>();
		ArrayList<String> org_fileNames = new ArrayList<String>();
		for(int i=0; i<singer_names.length; i++){
			String name = multi.getFilesystemName("uploadFile"+i);
			String org_name = multi.getOriginalFileName("uploadFile"+i);
			fileNames.add(name);
			org_fileNames.add(org_name);
			//System.out.println(name + "\n" + fileNames);
		}
		for(int i=0; i<singer_names.length; i++){
			//System.out.println(singer_names[i]+" - "+song_names[i]+"\n");
		}
		 		
        for(int i=0; i<fileNames.size(); i++){
        	newFileName = fileNames.get(i).substring(0 , fileNames.get(i).lastIndexOf(".")) + 
	 				"_" + 
	 					simDf.format(new Date(currentTime)) + 
	 					fileNames.get(i).substring(fileNames.get(i).lastIndexOf("."));
	        // 업로드된 파일 객체 생성
	        File oldFile = new File(path + fileNames.get(i));
	         
	        // 실제 저장될 파일 객체 생성
	        File newFile = new File(path + newFileName);
	 
	        // 파일명 rename
	        if(!oldFile.renameTo(newFile)){
	 
	            // rename이 되지 않을경우 강제로 파일을 복사하고 기존파일은 삭제
	 
	            buf = new byte[1024];
	            fin = new FileInputStream(oldFile);
	            fout = new FileOutputStream(newFile);
	            System.out.println("if문을 탔다");
	            read = 0;
	            oldFile.delete();
	            while((read=fin.read(buf,0,buf.length))!=-1){
	                fout.write(buf, 0, read);
	            }
	            fin.close();
	            fout.close();
	        }
	        bean.setSinger_name(singer_names[i]);
			bean.setSong_name(song_names[i]);
			bean.setFile_name(newFileName);
			bean.setUpload_name(org_fileNames.get(i));
			DB.insertMP3(bean);
        }
				
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

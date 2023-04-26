package board.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.model.BoardDAO;
import board.model.BoardVO;
import common.controller.AbstractAction;
import user.model.UserVO;

public class BoardEditAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 0. post방식일떄 한글 처리 ==>EncodingFilter 통ㅎ ㅐ처리
		// 1. 파일 업로드 처리
		String upDir=req.getServletContext().getRealPath("/upload");
		System.out.println(upDir);
		File dir=new File(upDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		DefaultFileRenamePolicy df=new DefaultFileRenamePolicy();
		MultipartRequest mr=new MultipartRequest(req, upDir, 100*1024*1024, "utf-8", df);
		System.out.println("업로드 성공!");
		// 2. 수정값 얻기
		String numStr=mr.getParameter("num");
		String subject=mr.getParameter("subject");
		// 3. 수정값 얻기
		if(numStr==null||subject==null||numStr.trim().isEmpty()||subject.trim().isEmpty()) {
			this.setViewPage("../boardList.do");
			this.setRedirect(true);
			return;
		}
		UserVO user=this.getLoginUser(req);
		
		String content=mr.getParameter("content");
		String userid=user.getUserid();
		String filename=mr.getFilesystemName("filename");
		long filesize=0;
		File file=mr.getFile("filename");
		if(file!=null) {
			//새로 첨부한 파일이 있다면
			filesize=file.length();//파일크기
			//예전에 첨부한 파일명 얻기
			String old_file=mr.getParameter("old_file");
			if(old_file!=null&& !old_file.trim().isEmpty()) {
				//서버에서 예전파일 지우기
				File delFile=new File(upDir, old_file);
					if(delFile!=null){
					boolean b=delFile.delete();
					System.out.println("파일삭제여부: "+b);
				}
			}
		}
		int num=Integer.parseInt(numStr.trim());
		
		BoardVO vo=new BoardVO(num,userid,subject,content,null,0,filename,filesize);
		
		BoardDAO dao=new BoardDAO();
		int n=dao.updateBoard(vo);
		
		String str=(n>0)?"수정 성공":"수정 실패";
		String loc="../boardList.do";
		
		req.setAttribute("msg", str);
		req.setAttribute("loc", loc);
		
		this.setViewPage("/message.jsp");
		this.setRedirect(false);
	}
}

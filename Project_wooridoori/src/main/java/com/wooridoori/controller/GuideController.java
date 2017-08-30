package com.wooridoori.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.PasswordAuthentication;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.imageio.ImageIO;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sun.xml.internal.messaging.saaj.packaging.mime.internet.MimeUtility;
import com.wooridoori.dao.MemberDAO;
import com.wooridoori.dto.GuideDTO;
import com.wooridoori.dto.MemberDTO;
import com.wooridoori.service.GuideService;
import com.wooridoori.service.MemberService;

import sun.misc.BASE64Decoder;


@Controller
public class GuideController {
	@Autowired
	MemberDAO mdao;
	
	@Autowired
	GuideService gService;
	@Autowired
	MemberService mService;
	
	
	
	///////////////////////////////Login///////////////////////////////////////
	//id,idsave
	@RequestMapping("log.wd")
	public String loginForm(HttpSession session,
							@RequestParam(defaultValue="")String id,
							@RequestParam(defaultValue="")String idSave){
		System.out.println("get in");
		session.setAttribute("id", id);
		session.setAttribute("idsave", idSave);
		return "Login/loginForm";
	}
	
	@RequestMapping("login.wd")
	public String loginProc(Model m, HttpServletRequest req,
						@ModelAttribute MemberDTO mdto,
						HttpSession session,
						@RequestParam(defaultValue="서울특별시")String addr	) throws IOException{
	//	System.out.println(mdto.getM_id()+""+mdto.getPassword());
		boolean log=mdao.loginCheck(mdto);
	//	System.out.println(req.getSession().getServletContext().getRealPath("")+"save\\GuidePreview\\");
		if(log){
			//Guide locate
			m.addAttribute("list",gService.getList(addr));
			//User info 
			mdto=mService.getMemberInfo(mdto.getM_id());
			session.setAttribute("id", mdto.getM_id());
			session.setAttribute("name", mdto.getName());
			session.setAttribute("guide", mdto.getGuide());			
			int f=mdto.getE_mail().indexOf("@");						
			session.setAttribute("email1", mdto.getE_mail().substring(0,f));
			session.setAttribute("email2", mdto.getE_mail().substring(f+1, mdto.getE_mail().length()));
			m.addAttribute("addr",addr);
			
			return "redirect:guideList.wd";
		}
		else{
			return "Login/loginForm";	
		}
	}
	
	
	////////////////////////////////Guide///////////////////////////////////////
	
	//Get list	
	@RequestMapping("guideList.wd")
	public String getList(HttpSession session, String addr, Model m, HttpServletRequest request){
			m.addAttribute("list",gService.getList(addr));
			return "Guide/GuideList";		
	}
	
	//Authentication check before write
	@RequestMapping("guideAuthentic.wd")
	public String guideAuthentic(HttpSession session, String addr, Model m){
		System.out.println(gService.isGuide((String)session.getAttribute("id")));
		if(gService.isGuide((String)session.getAttribute("id")).equals("Y")){	// Write guide board if guide auth already
			m.addAttribute("addr",addr);
			return "redirect:guideWriteForm.wd";
		}			
		else{																	// auth guide
			return "Guide/GuideAuthentic";
		}
	}
	
	//Guide write board
	@RequestMapping("guideWriteForm.wd")
	public String writeForm(String addr, Model m){
		m.addAttribute("addr",addr);
		return "Guide/GuideWriteForm";
	}
	
	//
	//Guide auth proc
	@RequestMapping("authentication.wd")
	public String guideAuthProc(HttpSession session,Model m) throws IOException{		//인증요청후 face recog
		
		boolean isSafe=gService.recog((String)session.getAttribute("id"));
		if(isSafe){
			return "Guide/GuideWriteForm";
		}
		else{
			m.addAttribute("comment","가이드인증에 실패 하였습니다. 관리자에게 문의하세요");
			return "Guide/GuideAuthentic";
		}
	}

	//E-mail auth
	@RequestMapping("emailAuth.wd")
	public String emailAuthProc( HttpServletRequest req,
							Model m, String email){			//e-mail auth
		
		String authNum=RandomNum();		
		sendEmail(email,authNum);		
		m.addAttribute("authNum",authNum);
		
		return "Guide/GuideEmailAuthentic";
	}
	
	
	//Guide info insert
	@RequestMapping("GuideInfoUpload.wd")
	@ResponseBody
	public String guideInfoUpload(HttpServletRequest request,String strImg,String id, Model m) throws IOException{
		String uploadPath=request.getSession().getServletContext().getRealPath("")+"\\save\\GuideFace\\";
		
		
		String[] strParts=strImg.split(",");
		String rstStrImg=strParts[1];
		//need user id for name of image
		String fileName=id+"face.png";	
		
		BufferedImage img=null;
		byte[] byteImg;
		BASE64Decoder decoder=new BASE64Decoder();
		byteImg=decoder.decodeBuffer(rstStrImg);
		ByteArrayInputStream bis=new ByteArrayInputStream(byteImg);
		img=ImageIO.read(bis);
		bis.close();
		
		String fullPath=uploadPath+fileName;
		//File folderObj=new File(uploadPath);
		//if(!folderObj.isDirectory())
		//	folderObj.mkdir();
		File out=new File(fullPath);
		if(out.exists())
			out.delete();
		ImageIO.write(img, "png", out);
		
		// Insert imagePath to DB 
		MemberDTO mdto=new MemberDTO();
		mdto.setM_id(id);
		mdto.setImagepath(fileName);
		mService.updateMemberPic(mdto);
		
		// Ajax proc (detect face)
		boolean detectFace=gService.detect(id);
		String d="true";
		if(detectFace==false)
			 d="false";
		
		return d;
	}
	
	//Guide write board
	@RequestMapping("GuideWriteAction.wd")
	public String guideWrite(Model m, String addr, MultipartFile fileup,
							MultipartHttpServletRequest request, 
							GuideDTO dto
							) throws IOException{
	//	GuideDTO dto =new GuideDTO();
		
		//Guide preview img path
		String path=request.getSession().getServletContext().getRealPath("")+"save\\GuidePreview\\";
		SimpleDateFormat  fmt = new SimpleDateFormat("yyyyMMdd");
		String date =  fmt.format(new Date());
		String fName=dto.getGb_name()+"_pre_"+date+".png";
	    File dir = new File(path); //파일 저장 경로 확인, 없으면 만든다.
	    if (!dir.exists()) {
	        dir.mkdirs();
	    }
	    dto.setgb_preview_imgpath(fName);
		//MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest)request;
	//	multi=new MultipartRequest(request, path,1024*1024*100,"UTF-8",new DefaultFileRenamePolicy());
		
	    byte[] bytes = fileup.getBytes();
	    File file = new File(path + fName);

        OutputStream out = new FileOutputStream(file);        
        out.write(bytes);


		
		//Data packaging
/*		dto.setgb_preview_imgpath(fName);
		dto.setGb_address_name(multi.getParameter("gb_name"));
		dto.setGb_content(multi.getParameter("gb_content"));
		dto.setGb_address(multi.getParameter("gb_address"));
		dto.setGb_address_name(multi.getParameter("gb_address_name"));
		dto.setGb_category_addr(multi.getParameter("gb_category_addr"));
		dto.setGb_keyword(multi.getParameter("gb_keyword"));
		dto.setGb_language(multi.getParameter("gb_language"));
		dto.setGb_lat(multi.getParameter("gb_lat"));
		dto.setGb_lon(multi.getParameter("gb_lon"));
		dto.setGb_meet_time(multi.getParameter("gb_meet_time"));
		dto.setGb_name(multi.getParameter("gb_name"));
		dto.setGb_price(multi.getParameter("gb_price"));
		dto.setGb_title(multi.getParameter("gb_title"));
		dto.setGb_service(multi.getParameter("gb_service"));
		dto.setGb_theme(multi.getParameter("gb_theme"));
		dto.setGb_time(multi.getParameter("gb_time"));*/
		
		gService.writeGuide(dto);
		
		//m.addAttribute("list",gService.getList(addr));
		m.addAttribute("addr",addr);
		return "redirect:guideList.wd";
	}
	
	//Guide content
	@RequestMapping("guideContent.wd")
	public String guideContent(String num, Model m){
		System.out.println(num);
		GuideDTO gdto=gService.getContent(num);
		
		
		m.addAttribute("gdto",gdto);
		return "Guide/GuideContent";
	}
	
	
	
	////////////////////////////////////////////////////////////////////////
	//Random number generate for email auth
	private String RandomNum(){
		StringBuffer sf=new StringBuffer();
		for(int i=0;i<=6;i++){
			int n=(int)(Math.random()*10);
			sf.append(n);
		}
		return sf.toString();
	}
	//Send to email to user for Auth
	private void sendEmail(String email,String authNum){
		String host="smtp.gmail.com";//smtp server
		String subject="WooriDoori Authentic Email";
		String from="Wooridoori Administer";
		String fromAddr="pjy9020@gamil.com";
		String to=email;
		String content="Authentication Number ["+authNum+"] <br>"
						+"Please input the number at 3 minutes";
		
		try{
			Properties prop=new Properties();
			prop.put("mail.smtp.starttls", "true");
			prop.put("mail.transport.protocol", "smtp");
			prop.put("mail.smtp.host", host);
			prop.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			prop.put("mail.smtp.port", "465");
			prop.put("mail.smtp.user", fromAddr);
			prop.put("mail.smtp.auth", "true");
			
			Session mSession= 
					Session.getInstance(prop,new javax.mail.Authenticator(){
						protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
							return new javax.mail.PasswordAuthentication("pjy9020", "tbsk9107!");
						}
					});
			Message msg=new MimeMessage(mSession);
			msg.setFrom(new InternetAddress(fromAddr,MimeUtility.encodeText(from,"UTF-8","B")));
			if(!email.equals("@")){
				InternetAddress[]addr={new InternetAddress(to)};
				msg.setRecipients(Message.RecipientType.TO, addr);
				msg.setSubject(subject);
				msg.setSentDate(new java.util.Date());
				msg.setContent(content,"text/html;charset=euc-kr");
				Transport.send(msg);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
}
 
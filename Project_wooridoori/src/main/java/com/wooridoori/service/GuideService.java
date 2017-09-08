package com.wooridoori.service;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.awt.image.PixelGrabber;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.List;
import java.util.Vector;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;

//OpenCV-2.4
import org.opencv.core.Core;
import org.opencv.core.Mat;
import org.opencv.core.MatOfRect;
import org.opencv.core.Point;
import org.opencv.core.Rect;
import org.opencv.core.Scalar;
import org.opencv.highgui.Highgui;
import org.opencv.objdetect.*;

//OpenCV-3.2
import org.opencv.core.CvType;
import org.opencv.core.MatOfDMatch;
import org.opencv.core.MatOfKeyPoint;
import org.opencv.features2d.DMatch;
import org.opencv.features2d.DescriptorExtractor;
import org.opencv.features2d.DescriptorMatcher;
import org.opencv.features2d.FeatureDetector;
import org.opencv.imgcodecs.Imgcodecs;


//import org.opencv.imgcodecs.Imgcodecs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.prism.Image;
import com.wooridoori.dao.GuideDAO;
import com.wooridoori.dto.GuideDTO;

@Service
public class GuideService{
	@Autowired
	GuideDAO gdao;
	
	static boolean isLoad=false;
	
	//	static{ System.loadLibrary(Core.NATIVE_LIBRARY_NAME); }
	static {	//Never use loadLibrary!! 
		if(isLoad==false){
			System.load("C:\\opencv_2.4\\build\\java\\x64\\opencv_java2413.dll");
			System.load("C:\\opencv\\build\\java\\x64\\opencv_java320.dll");
			isLoad=true;
		}
	}
	
	
	public List<GuideDTO> getList(String addr,int start,int end){
		return  gdao.getList(addr,start,end);
	}
	
	public String getListCount(String addr){
		return  gdao.getListCount(addr);
	}
	
	public void guideAuthUpdate(String m_id){
		gdao.guideAuthUpdate(m_id);
	}
	
	public String isGuide(String id){
		return gdao.isGuide(id);
	}
	
	public void writeGuide(GuideDTO dto){
		gdao.writeGuide(dto);
	}
	public GuideDTO getContent(String num){
		return gdao.getContent(num);
	}
	
	public List<GuideDTO> hashSearch(String addr,String hash,int start,int end){
		return gdao.hashSearch(addr,hash,start,end);		
	}
	public String getGuideHashListCount(String addr,String hash){
		return gdao.getGuideHashListCount(addr, hash);
	}
	public List<GuideDTO> themeSearch(String addr,String theme,int start,int end){
		return gdao.themeSearch(addr,theme,start,end);		
	}
	public String getGuideThemeListCount(String addr,String theme){
		return gdao.getGuideThemeListCount(addr, theme);
	}
	public List<GuideDTO> guideNearestOfList(double lat,double lon){
		return gdao.guideNearestOfList(lat, lon);
	}
	
	
	
	public boolean faceRecog(String id,String path) throws IOException{
/*		//Load the cascades
		 CascadeClassifier faceDetector = new CascadeClassifier(GuideService.class.getResource("haarcascade_frontalface_alt.xml").getPath().substring(1));
		 CascadeClassifier face_cascade = new CascadeClassifier("haarcascade_frontalface_default.xml");
		 CascadeClassifier eye_cascade = new CascadeClassifier("haarcascade_eye.xml");
		
		 //Image read
		 String path="C:\\Tour\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\wooridoori\\save\\GuideFace\\";
		 File input=new File(path+"testface");
		 BufferedImage img=null;
		// img=ImageIO.read(input);
		 */
		 
		 
		 //org.opencv.contrib.FaceRecognizer
		
		//detect(id);
		boolean isWarn=recog(id,path);
		return true;
	}
	
	/**
	 * Detect Face 7-way
	 * @Author: Jay Park
	 */
	/* detect And display */
	public  boolean detect(String id,String path) throws IOException{
		boolean isSuccess=true;
		File dir = new File(path);
	    if (!dir.exists()) {
	        dir.mkdirs();
	    }
		//String path="C:\\Tour\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\wooridoori\\save\\GuideFace\\";
		 // Create a face detector from the cascade file in the resources directory
		CascadeClassifier faceDetector = new CascadeClassifier(GuideService.class.getResource("lbpcascade_frontalface.xml").getPath().substring(1));
		CascadeClassifier faceDetector2 = new CascadeClassifier(GuideService.class.getResource("haarcascade_frontalface_alt.xml").getPath().substring(1));
		CascadeClassifier faceDetector3 = new CascadeClassifier(GuideService.class.getResource("haarcascade_profileface.xml").getPath().substring(1));
		CascadeClassifier faceDetector4 = new CascadeClassifier(GuideService.class.getResource("haarcascade_frontalface_alt2.xml").getPath().substring(1));
		CascadeClassifier faceDetector5 = new CascadeClassifier(GuideService.class.getResource("haarcascade_frontalface_alt_tree.xml").getPath().substring(1));
		CascadeClassifier faceDetector6 = new CascadeClassifier(GuideService.class.getResource("haarcascade_frontalcatface_extended.xml").getPath().substring(1));
		CascadeClassifier faceDetector7 = new CascadeClassifier(GuideService.class.getResource("lbpcascade_frontalface.xml").getPath().substring(1));
	    // Detect faces in the image
		Mat image = Highgui.imread(path+id+"face.png");
		//BufferedImage img = ImageIO.read(new File(path+id+"testface.png"));
		
		// MatOfRect is a special container class for Rect
	    MatOfRect faceDetections = new MatOfRect();
	    // 7faceDetector are find face
	    faceDetector.detectMultiScale(image, faceDetections);
	    if(faceDetections.toArray().length==0){
	    	faceDetector2.detectMultiScale(image, faceDetections);
	    	System.out.println("1");
	    }
	    if(faceDetections.toArray().length==0){
	    	faceDetector3.detectMultiScale(image, faceDetections);
	    	System.out.println("2");
	    }
	    if(faceDetections.toArray().length==0){
	    	faceDetector4.detectMultiScale(image, faceDetections);
	    	System.out.println("3");
	    } 
	    if(faceDetections.toArray().length==0){
	    	faceDetector5.detectMultiScale(image, faceDetections);
	    	System.out.println("4");
	    }if(faceDetections.toArray().length==0){
	    	faceDetector6.detectMultiScale(image, faceDetections);
	    	System.out.println("5");
	    	isSuccess=false; 		// 7-detector were undetected face 
	    }
	    // Additional detector 
/*	    if(faceDetections.toArray().length==0){
	    	faceDetector7.detectMultiScale(image, faceDetections);
	    	System.out.println("6");
	    	
	    }*/
	    System.out.println(String.format("Detected %s faces", faceDetections.toArray().length));
	    Rect rectOut=null;
	    
	    // Draw a bounding box around each face.
	    for (Rect rect : faceDetections.toArray()) {
	    	// Draw rect to input
	    	Core.rectangle(image, new Point(rect.x, rect.y), new Point(rect.x + rect.width, rect.y + rect.height), new Scalar(0, 0, 255));
	    	// Save rect for output
	    	rectOut = new Rect(rect.x, rect.y, rect.width, rect.height);
	    }
	    // Save the visualized detection.
	    if(isSuccess){
		    String filename = path+id+"face_detect.png";
		    System.out.println(String.format("Writing %s", filename));
		   // Save face
		    Highgui.imwrite(filename, new Mat(image,rectOut));
		    // Resizing image
		    int newWidth = 150;              
		    int newHeight = 150;             
		    imgResize(path+id+"face_detect.png", path+id+"face_result.png", "png", newWidth, newHeight);
	    }
	   
	    
		

	    
	    
	    return isSuccess;
	    
	    //FaceRecognizer fr;//= new LBPHFaceRecognizer();
	   // FaceRecognizer fr = Face.createLBPHFaceRecognizer();
	}
	
	
	/**
	 * Compare that two images is similar using feature mapping  
	 * @Author: Jay Park
	 * @Reference: minikim
	 */
	public boolean recog(String id,String path){
		int retVal = 0;
		//long startTime = System.currentTimeMillis();
		
		
		// Directory
		String warnDir = path+"\\save\\GuideFace\\";
		File dir = new File(warnDir);
	    if (!dir.exists()) {
	    	dir.mkdirs();
	    }
		String fileName=warnDir+id+"face_result.png";

		// Load images to compare
		Mat target = Highgui.imread(fileName);		
		
		File warnList=new File(warnDir);
		
		// Number of file
		String[] s = warnList.list();  	  
		
		// Loop for amount of file
		for(int k=0;k<warnList.list().length;k++){
			if( !(s[k].equals(id+"face_result.png")) && (s[k].contains("face_result")) ){// result pic & Not myPic
				System.out.println(s[k]);
				Mat img2 = Highgui.imread(warnDir+s[k]);
	
				// Declare key point of images
				MatOfKeyPoint keypoints1 = new MatOfKeyPoint();
				MatOfKeyPoint keypoints2 = new MatOfKeyPoint();
				Mat descriptors1 = new Mat();
				Mat descriptors2 = new Mat();
	
				// Definition of ORB key point detector and descriptor extractors
				FeatureDetector detector = FeatureDetector.create(FeatureDetector.ORB); 
				DescriptorExtractor extractor = DescriptorExtractor.create(DescriptorExtractor.ORB);
	
				// Detect key points
				detector.detect(target, keypoints1);
				detector.detect(img2, keypoints2);
				
				// Extract descriptors
				extractor.compute(target, keypoints1, descriptors1);
				extractor.compute(img2, keypoints2, descriptors2);
	
				// Definition of descriptor matcher
				DescriptorMatcher matcher = DescriptorMatcher.create(DescriptorMatcher.BRUTEFORCE_HAMMING);
	
				// Match points of two images
				MatOfDMatch matches = new MatOfDMatch();
	//			System.out.println("Type of Image1= " + descriptors1.type() + ", Type of Image2= " + descriptors2.type());
	//			System.out.println("Cols of Image1= " + descriptors1.cols() + ", Cols of Image2= " + descriptors2.cols());
				
				// Avoid to assertion failed
				// Assertion failed (type == src2.type() && src1.cols == src2.cols && (type == CV_32F || type == CV_8U)
				if (descriptors2.cols() == descriptors1.cols()) {
					matcher.match(descriptors1, descriptors2 ,matches);
			
					// Check matches of key points
					DMatch[] match = matches.toArray();
					double max_dist = 0; double min_dist = 100;
					
					for (int i = 0; i < descriptors1.rows(); i++) { 
						double dist = match[i].distance;
					    if( dist < min_dist ) min_dist = dist;
					    if( dist > max_dist ) max_dist = dist;
					}
					System.out.println("max_dist=" + max_dist + ", min_dist=" + min_dist);
					
				    // Extract good images (distances are under 35)
					for (int i = 0; i < descriptors1.rows(); i++) {
						if (match[i].distance <= 20) {
							retVal++;
						}
					}
				
				}
				
				//long estimatedTime = System.currentTimeMillis() - startTime;
				//System.out.println("estimatedTime=" + estimatedTime + "ms");
				System.out.println("matching count=" + retVal);
				if(retVal>0){
					System.out.println("-----------Same Picture--------------");
					System.out.println();
					return false;
					
				}
				 retVal = 0;
			}
		}	
		return true;
			
		
	}
	
	



	/**
	 * Image Resize
	 */
	public static void imgResize(String imgSourcePath, String imgTargetPath, String imgFormat, int newWidth, int newHeight)
	{
	    try
	    {
	        // 원본 이미지 가져오기
	    	java.awt.Image imgSrc = ImageIO.read(new File(imgSourcePath));

	        // 이미지 리사이즈
	        // Image.SCALE_DEFAULT : 기본 이미지 스케일링 알고리즘 사용
	        // Image.SCALE_FAST    : 이미지 부드러움보다 속도 우선
	        // Image.SCALE_SMOOTH  : 속도보다 이미지 부드러움을 우선
	        // Image.SCALE_AREA_AVERAGING  : 평균 알고리즘 사용
	        java.awt.Image resizeImage = imgSrc.getScaledInstance(newWidth, newHeight,  java.awt.Image.SCALE_SMOOTH);

	        // 새 이미지  저장하기
	        BufferedImage newImage = new BufferedImage(newWidth, newHeight, BufferedImage.TYPE_INT_RGB);
	        Graphics g = newImage.getGraphics();
	        g.drawImage(resizeImage, 0, 0, null);
	        g.dispose();
	        
	        File out=new File(imgTargetPath);
	    	if(out.exists())
				out.delete();
	        ImageIO.write(newImage, imgFormat, out);
	    }
	    catch (Exception e)
	    {
	    }
	}
	
	
	
	
	
	
	
	
/*	   public BufferedImage Mat2BufferedImage(Mat m){
		// source: http://answers.opencv.org/question/10344/opencv-java-load-image-to-gui/
		// Fastest code
		// The output can be assigned either to a BufferedImage or to an Image

		    int type = BufferedImage.TYPE_BYTE_GRAY;
		    if ( m.channels() > 1 ) {
		        type = BufferedImage.TYPE_3BYTE_BGR;
		    }
		    int bufferSize = m.channels()*m.cols()*m.rows();
		    byte [] b = new byte[bufferSize];
		    m.get(0,0,b); // get all the pixels
		    BufferedImage image = new BufferedImage(m.cols(),m.rows(), type);
		    byte[] targetPixels = ((DataBufferByte) image.getRaster().getDataBuffer()).getData();
		    System.arraycopy(b, 0, targetPixels, 0, b.length);  
		    return image;

		}*/
}


package com.wooridoori.service;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooridoori.dao.GuideDAO;
import com.wooridoori.dao.MemberDAO;
import com.wooridoori.dto.MemberDTO;

@Service
public class MemberService {
	@Autowired
	MemberDAO mDao;
	@Autowired
	GuideDAO gDao;

	
	public MemberDTO getMemberInfo(String id){
		return mDao.getMemberInfo(id);
	}
	public void updateMemberPic(MemberDTO dto){
		mDao.updateMemberPic(dto);
	}
	
	/////////////////////////////////////////////////////////
	public ArrayList<String> loginform(){
		ArrayList<String> list = new ArrayList<String>();
		list.add("Afghanistan");
		list.add("Albania");
		list.add("Algeria");
		list.add("Andorra");
		list.add("Angola");
		list.add("Antigua and Barbuda");
		list.add("Argentina");
		list.add("Armenia");
		list.add("Australia");
		list.add("Austria");
		list.add("Azerbaijan");
		list.add("Bahamas");
		list.add("Bahrain");
		list.add("Bangladesh");
		list.add("Barbados");
		list.add("Belarus");
		list.add("Belgium");
		list.add("Belize");
		list.add("Benin");
		list.add("Bhutan");
		list.add("Bolivia");
		list.add("Bosnia and Herzegovina");
		list.add("Botswana");
		list.add("Brazil");
		list.add("Brunei Darussalam");
		list.add("Bulgaria");
		list.add("Burkina Faso");
		list.add("Burundi");
		list.add("Cambodia");
		list.add("Cameroon");
		list.add("Canada");
		list.add("Cape Verde");
		list.add("Central African Republic");
		list.add("Chad");
		list.add("Chile");
		list.add("China");
		list.add("Colombia");
		list.add("Comoros");
		list.add("Congo(Republic of the)");
		list.add("Costa Rica");
		list.add("Côte d’Ivoire");
		list.add("Croatia");
		list.add("Cuba");
		list.add("Cyprus");
		list.add("Czech Republic");
		list.add("Democratic People’s Republic of Korea");
		list.add("Democratic Republic of the Congo");
		list.add("Denmark");
		list.add("Djibouti");
		list.add("Dominica");
		list.add("Dominican Republic");
		list.add("Ecuador");
		list.add("Egypt");
		list.add("El Salvador");
		list.add("Equatorial Guinea");
		list.add("Eritrea");
		list.add("Estonia");
		list.add("Ethiopia");
		list.add("Fiji");
		list.add("Finland");
		list.add("France");
		list.add("Gabon");
		list.add("Gambia");
		list.add("Georgia");
		list.add("Germany");
		list.add("Ghana");
		list.add("Greece");
		list.add("Grenada");
		list.add("Guatemala");
		list.add("Guinea");
		list.add("Guinea-Bissau");
		list.add("Guyana");
		list.add("Haiti");
		list.add("Honduras");
		list.add("Hungary");
		list.add("Iceland");
		list.add("India");
		list.add("Indonesia");
		list.add("Iran");
		list.add("Iraq");
		list.add("Ireland");
		list.add("Israel");
		list.add("Italy");
		list.add("Jamaica");
		list.add("Japan");
		list.add("Jordan");
		list.add("Kazakhstan");
		list.add("Kenya");
		list.add("Kiribati");
		list.add("Kuwait");
		list.add("Kyrgyzstan");
		list.add("Lao People’s Democratic Republic");
		list.add("Latvia");
		list.add("Lebanon");
		list.add("Lesotho");
		list.add("Liberia");
		list.add("Libya");
		list.add("Liechtenstein");
		list.add("Lithuania");
		list.add("Luxembourg");
		list.add("Madagascar");
		list.add("Malawi");
		list.add("Malaysia");
		list.add("Maldives");
		list.add("Mali");
		list.add("Malta");
		list.add("Marshall Islands");
		list.add("Mauritania");
		list.add("Mauritius");
		list.add("Mexico");
		list.add("Micronesia(Federated States of)");
		list.add("Monaco");
		list.add("Mongolia");
		list.add("Montenegro");
		list.add("Morocco");
		list.add("Mozambique");
		list.add("Myanmar");
		list.add("Namibia");
		list.add("Nauru");
		list.add("Nepal");
		list.add("Netherlands");
		list.add("New Zealand");
		list.add("Nicaragua");
		list.add("Niger");
		list.add("Nigeria");
		list.add("Norway");
		list.add("Oman");
		list.add("Pakistan");
		list.add("Palau");
		list.add("Panama");
		list.add("Papua New Guinea");
		list.add("Paraguay");
		list.add("Peru");
		list.add("Philippines");
		list.add("Poland");
		list.add("Portugal");
		list.add("Qatar");
		list.add("Republic of Korea");
		list.add("Republic of Moldova");
		list.add("Romania");
		list.add("Russian Federation");
		list.add("Rwanda");
		list.add("Saint Kitts and Nevis");
		list.add("Saint Lucia");
		list.add("Saint Vincent and the Grenadines");
		list.add("Samoa");
		list.add("San Marino");
		list.add("Sao Tome and Principe");
		list.add("Saudi Arabia");
		list.add("Senegal");
		list.add("Serbia");
		list.add("Seychelles");
		list.add("Sierra Leone");
		list.add("Singapore");
		list.add("Slovakia");
		list.add("Slovenia");
		list.add("Solomon Islands");
		list.add("Somalia");
		list.add("South Africa");
		list.add("Spain");
		list.add("Sri Lanka");
		list.add("Sudan");
		list.add("Suriname");
		list.add("Swaziland");
		list.add("Switzerland");
		list.add("Sweden");
		list.add("Syria");
		list.add("Tajikistan");
		list.add("Thailand");
		list.add("The former Yugoslav Republic of Macedonia");
		list.add("Timor Leste");
		list.add("Togo");
		list.add("Tonga");
		list.add("Trinidad and Tobago");
		list.add("Tunisia");
		list.add("Turkey");
		list.add("Turkmenistan");
		list.add("Tuvalu");
		list.add("Uganda");
		list.add("Ukraine");
		list.add("United Arab Emirates");
		list.add("United Kingdom");
		list.add("United of Republic of Tanzania");
		list.add("United States");
		list.add("Uruguay");
		list.add("Uzbekistan");
		list.add("Vanuatu");
		list.add("Venezuela");
		list.add("Viet Nam");
		list.add("Yemen");
		list.add("Zambia");
		list.add("Zimbabwe");
		
		return list;
	}
	
	public String beforeAddress(HttpServletRequest request){
		String referrer = request.getHeader("Referer");
		
		request.getSession().setAttribute("prevPage", referrer);
	    String addr = "";
	    if(referrer.indexOf("?")!=-1){
	    	addr = referrer.substring(referrer.indexOf("=")+1);
	    }
	    System.out.println(addr);
	    return addr;
	}

	public void memberInsert(MemberDTO mdto){
		mDao.memberInsert(mdto);
	}
	
	public boolean idCheck(String id){
		return mDao.idCheck(id);
	}
	
	public boolean loginCheck(MemberDTO mdto){
		return mDao.loginCheck(mdto);
	}
}
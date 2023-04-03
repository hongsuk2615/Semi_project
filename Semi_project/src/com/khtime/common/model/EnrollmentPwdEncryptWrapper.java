package com.khtime.common.model;

import java.io.IOException;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

public class EnrollmentPwdEncryptWrapper extends MultipartRequest{

	public EnrollmentPwdEncryptWrapper(HttpServletRequest request, String saveDirectory, int maxPostSize,
			FileRenamePolicy policy) throws IOException {
		super(request, saveDirectory, maxPostSize, policy);
		// TODO Auto-generated constructor stub
	}

	public EnrollmentPwdEncryptWrapper(HttpServletRequest arg0, String arg1, int arg2, String arg3,
			FileRenamePolicy arg4) throws IOException {
		super(arg0, arg1, arg2, arg3, arg4);
		// TODO Auto-generated constructor stub
	}

	public EnrollmentPwdEncryptWrapper(HttpServletRequest request, String saveDirectory, int maxPostSize,
			String encoding) throws IOException {
		super(request, saveDirectory, maxPostSize, encoding);
		// TODO Auto-generated constructor stub
	}

	public EnrollmentPwdEncryptWrapper(HttpServletRequest request, String saveDirectory, int maxPostSize)
			throws IOException {
		super(request, saveDirectory, maxPostSize);
		// TODO Auto-generated constructor stub
	}

	public EnrollmentPwdEncryptWrapper(HttpServletRequest request, String saveDirectory, String encoding)
			throws IOException {
		super(request, saveDirectory, encoding);
		// TODO Auto-generated constructor stub
	}

	public EnrollmentPwdEncryptWrapper(HttpServletRequest request, String saveDirectory) throws IOException {
		super(request, saveDirectory);
		// TODO Auto-generated constructor stub
	}

	public EnrollmentPwdEncryptWrapper(ServletRequest request, String saveDirectory, int maxPostSize)
			throws IOException {
		super(request, saveDirectory, maxPostSize);
		// TODO Auto-generated constructor stub
	}

	public EnrollmentPwdEncryptWrapper(ServletRequest request, String saveDirectory) throws IOException {
		super(request, saveDirectory);
		// TODO Auto-generated constructor stub
	}

	@Override
	public String getParameter(String name) {
		String value = "";
		System.out.println(name);
		// 매개변수로 전달받은 name변수의 값이 userPwd일때 암호화 작업 수행하기
		if (name.equals("userPwd")) {
			//암호화 시켜주기
			System.out.println("암호화 전 비밀번호 : " + super.getParameter(name));
			value = getSHA512(super.getParameter(name));
			System.out.println("암호화 후 비밀번호 : " + value);
		}else {
			value = super.getParameter(name);
		}
		return value;
	}
	
	public String getSHA512(String val) {
		String encPwd = "";
		//암호화 처리 객체 선언
		MessageDigest md = null;
		
		//사용할 암호화 알고리즘 선택해서 객체 생성
		try {
			md = MessageDigest.getInstance("SHA-512");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		// 암호화는 bit연산하고, bit연산한 결과를 byte[]에 담아서 보관.
		byte[] bytes = val.getBytes(Charset.forName("UTF-8"));
		md.update(bytes);
		// bit연산하고 그 결과값은 byte[]배열 이므로, String형태로 변환
		encPwd = Base64.getEncoder().encodeToString(md.digest());
		
		return encPwd;
	}
	
}

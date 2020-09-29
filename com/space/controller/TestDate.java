package com.space.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class TestDate {
	/**
	 * �\��y�z: ����ɶ��q�������I�p��
	 * 
	 * @�ЫؤH jl
	 * @��� 2019/3/18
	 * @�Ѽ�[dBegin, dEnd] @��^�� java.util.List<java.lang.String>
	 */
	public List<String> findDates(Date dBegin, Date dEnd) {
		List<String> lDate = new ArrayList<String>();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH");
		lDate.add(sd.format(dBegin));
		Calendar calBegin = Calendar.getInstance();
		// �ϥε��w�� Date �]�m�� Calendar ���ɶ�
		calBegin.setTime(dBegin);
		Calendar calEnd = Calendar.getInstance();
		// �ϥε��w�� Date �]�m�� Calendar ���ɶ�
		calEnd.setTime(dEnd);
		// ���զ�����O�_�b���w�������
		while (dEnd.after(calBegin.getTime())) {
			// �ھڤ�䪺�W�h�A�����w�����r�q�K�[�δ�h���w���ɶ��q
			calBegin.add(Calendar.HOUR, 1);
			lDate.add(sd.format(calBegin.getTime()));
		}
		System.out.println(lDate);
		return lDate;
	}
	
	public static void main(String args[]) {
		TestDate testDate = new TestDate();
		System.out.println(testDate);
	}
}

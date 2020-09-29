package com.space.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class TestDate {
	/**
	 * 功能描述: 獲取時間段內的整點小時
	 * 
	 * @創建人 jl
	 * @日期 2019/3/18
	 * @參數[dBegin, dEnd] @返回值 java.util.List<java.lang.String>
	 */
	public List<String> findDates(Date dBegin, Date dEnd) {
		List<String> lDate = new ArrayList<String>();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH");
		lDate.add(sd.format(dBegin));
		Calendar calBegin = Calendar.getInstance();
		// 使用給定的 Date 設置此 Calendar 的時間
		calBegin.setTime(dBegin);
		Calendar calEnd = Calendar.getInstance();
		// 使用給定的 Date 設置此 Calendar 的時間
		calEnd.setTime(dEnd);
		// 測試此日期是否在指定日期之後
		while (dEnd.after(calBegin.getTime())) {
			// 根據日曆的規則，為給定的日曆字段添加或減去指定的時間量
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

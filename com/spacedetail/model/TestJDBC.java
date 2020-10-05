package com.spacedetail.model;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.List;
import java.util.Calendar;
import java.util.Date;

public class TestJDBC {
	public static void main(String[] args) {

		SpaceDetailDAO_interface dao = new SpaceDetailDAO();

		// All
//		List<SpaceDetailVO> list = dao.getAll();
//		for(SpaceDetailVO spaceDetailVO : list) {
//			System.out.println(spaceDetailVO.getSpaceDetailId());
//			System.out.println(spaceDetailVO.getSpaceId());
//			System.out.println(spaceDetailVO.getSpaceDetailFreeDate());
//			System.out.println(spaceDetailVO.getSpaceDetailFreeTimeStart());
//			System.out.println(spaceDetailVO.getSpaceDetailFreeTimeEnd());
//			System.out.println(spaceDetailVO.getSpaceDetailCharge());
//		}		
//		System.out.println("Test All");

		// One
		SpaceDetailVO one = dao.selectOne("SD00001");
		System.out.println(one.getSpaceDetailId());
		System.out.println(one.getSpaceId());
		System.out.println(one.getSpaceDetailFreeDate());
		System.out.println(one.getSpaceDetailFreeTimeStart());
		System.out.println(one.getSpaceDetailFreeTimeEnd());
		System.out.println(one.getSpaceDetailCharge());
		System.out.println("Test One");

		java.sql.Date spaceSignupDate = null;
		spaceSignupDate = new java.sql.Date(System.currentTimeMillis());
		System.out.println(spaceSignupDate);
		
		long time = (one.getSpaceDetailFreeTimeEnd().getTime() - one.getSpaceDetailFreeTimeStart().getTime())
				/ (60 * 60 * 1000);
		System.out.println(time);

		// insert
//		SpaceDetailVO add = new SpaceDetailVO();
//		add.setSpaceId("SPACE00001");
//		add.setSpaceDetailFreeDate(java.sql.Date.valueOf("2020-09-21"));
//		add.setSpaceDetailFreeTimeStart(java.sql.Timestamp.valueOf("2020-09-21 02:00:00.0"));
//		add.setSpaceDetailFreeTimeEnd(java.sql.Timestamp.valueOf("2020-09-21 15:00:00.0"));
//		add.setSpaceDetailCharge(870);
//		dao.insert(add);
//		System.out.println("Data Inserted");

		// delete
//		dao.delete("5");
//		System.out.println("Data Deleted");

		// update
//		SpaceDetailVO update = new SpaceDetailVO();
//		update.setSpaceDetailId("SD00003");
//		update.setSpaceId("SPACE00001");
//		update.setSpaceDetailFreeDate(java.sql.Date.valueOf("2020-09-01"));
//		update.setSpaceDetailFreeTimeStart(java.sql.Timestamp.valueOf("2020-09-01 13:00:00.0"));
//		update.setSpaceDetailFreeTimeEnd(java.sql.Timestamp.valueOf("2020-09-01 23:00:00.0"));
//		update.setSpaceDetailCharge(780);
//		dao.update(update);
//		System.out.println("data updated");

	}
}

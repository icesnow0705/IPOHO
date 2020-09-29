package com.spacedetail.model;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

public class TestJDBC {
	public static void main(String[] args) {
		
		SpaceDetailDAO_interface dao = new SpaceDetailDAO();
		
//		ByteArrayOutputStream baos = null;
//		try {
//			File file = new File("C:\\Users\\user\\Desktop\\allshit.gif");
//			File file = new File("C:\\Users\\HENRYZ\\Desktop\\zzz.jpg");
//			FileInputStream fis = new FileInputStream(file);
//			baos = new ByteArrayOutputStream();
//			byte[] buffer = new byte[8192];
//			int i;
//			while ((i = fis.read(buffer)) != -1) {
//				baos.write(buffer, 0, i);
//			}
//			baos.close();
//			fis.close();
//		} catch (FileNotFoundException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		
		//All
//		List<SpaceDetailVO> list = dao.getAll();
//		for(SpaceDetailVO spaceDetailVO : list) {
//			System.out.println(spaceDetailVO.getSpaceDetailId());
//			System.out.println(spaceDetailVO.getSpaceId());
//			System.out.println(spaceDetailVO.getSpaceDetailFreeDate());
//			System.out.println(spaceDetailVO.getSpaceDetailCharge());
//		}		
//		System.out.println("Test All");
		
		//One
//		SpaceDetailVO one = dao.selectOne("SD00001");
//		System.out.println(one.getSpaceDetailId());
//		System.out.println(one.getSpaceId());
//		System.out.println(one.getSpaceDetailFreeDate());
//		System.out.println(one.getSpaceDetailCharge());
//		System.out.println("Test One");
		
		//insert
//		SpaceDetailVO add = new SpaceDetailVO();
//		add.setSpaceId("SPACE00001");
//		add.setSpaceDetailFreeDate(java.sql.Date.valueOf("2020-09-21"));
//		add.setSpaceDetailCharge(870);
//		add.setSpaceDetailText("spaceText");
//		dao.insert(add);
//		System.out.println("Data Inserted");
		
		//delete
//		dao.delete("4");
//		System.out.println("Data Deleted");
		
		//update
		SpaceDetailVO update = new SpaceDetailVO();
		update.setSpaceDetailId("SD00003");
		update.setSpaceId("SPACE00001");
		update.setSpaceDetailFreeDate(java.sql.Date.valueOf("2020-09-01"));
		update.setSpaceDetailCharge(780);
		update.setSpaceDetailText("spaceText");
		dao.update(update);
		System.out.println("data updated");
		
	}
}

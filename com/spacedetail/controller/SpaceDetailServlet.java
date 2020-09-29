package com.spacedetail.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.spacedetail.model.*;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
@WebServlet("/spacedetail/spacedetail.do")
public class SpaceDetailServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("getOne_For_Display".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String str = req.getParameter("spaceDetailId");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("場地明細ID請勿空白");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/spacedetail/spaceDetailHome");
					failureView.forward(req, res);
					return;
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/spacedetail/spaceDetailHome");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.新增資料 *****************************************/
				SpaceDetailService spaceDetailSvc = new SpaceDetailService();
				SpaceDetailVO spaceDetailVO = spaceDetailSvc.selectOneSpaceDetail(str);
				if (spaceDetailVO == null) {
					errorMsgs.add("spaceDetailVO錯誤");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/spacedetail/spaceDetailHome");
					failureView.forward(req, res);
					return;
				}

				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) *************/
				req.setAttribute("spaceDetailVO", spaceDetailVO); // ��Ʈw���X��spaceDetailVO����,�s�Jreq
				String url = "/spacedetail/listOneSpaceDetail.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneSpaceDetail.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/spacedetail/spaceDetailHome");
				failureView.forward(req, res);
			}
		}
		
		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllSpaceDetail.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.�����ШD�Ѽ� ****************************************/
				String spaceDetailId = req.getParameter("spaceDetailId");

				/*************************** 2.�}�l�d�߸�� ****************************************/
				SpaceDetailService spaceDetailSvc = new SpaceDetailService();
				SpaceDetailVO spaceDetailVO = spaceDetailSvc.selectOneSpaceDetail(spaceDetailId);

				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) ************/
				req.setAttribute("spaceDetailVO", spaceDetailVO); // ��Ʈw���X��spaceDetailVO����,�s�Jreq
				String url = "/spacedetail/updateSpaceDetail.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� updateSpaceDetail.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/spacedetail/listAllSpaceDetail.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // �Ӧ�updateSpaceDetail.jsp���ШD
			List<String> errorMessages = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMessages);
			
			try {
				/*************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/

				String spaceDetailId = new String(req.getParameter("spaceDetailId").trim());
				if (spaceDetailId == null || spaceDetailId.trim().length() == 0) {
					errorMessages.add("���a����ID�ФŪť�");
				}

				String spaceId = req.getParameter("spaceId");
				if (spaceId == null || spaceId.trim().length() == 0) {
					errorMessages.add("���aID�ФŪť�");
				}

				java.sql.Date spaceDetailFreeDate = null;
				try {
					spaceDetailFreeDate = java.sql.Date.valueOf(req.getParameter("spaceDetailFreeDate").trim());
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
					errorMessages.add("�ӫ~�}��ɶ����~");
				}
				
				Integer spaceDetailCharge = null;
				try {
					spaceDetailCharge = Integer.parseInt(req.getParameter("spaceDetailCharge").trim());
					if(spaceDetailCharge <= 0) errorMessages.add("���a�ɬq���B: �нT�{���B");
				} catch (NumberFormatException e) {
					spaceDetailCharge = 0;
					errorMessages.add("���a�ɬq���B: �������Ʀr");
				}
				
				String spaceDetailText = new String(req.getParameter("spaceDetailText").trim());
				if (spaceDetailText == null || spaceDetailText.trim().length() == 0) {
					errorMessages.add("���a���нФŪť�");
				}
				
				SpaceDetailVO spaceDetailVO = new SpaceDetailVO();
				spaceDetailVO.setSpaceDetailId(spaceDetailId);
				spaceDetailVO.setSpaceId(spaceId);
				spaceDetailVO.setSpaceDetailFreeDate(spaceDetailFreeDate);
				spaceDetailVO.setSpaceDetailCharge(spaceDetailCharge);
				spaceDetailVO.setSpaceDetailText(spaceDetailText);
				
				// Send the use back to the form, if there were errors
				if (!errorMessages.isEmpty()) {
					req.setAttribute("spaceDetailVO", spaceDetailVO); // �t����J�榡���~��spaceDetailVO����,�]�s�Jreq
					RequestDispatcher failureView = req.getRequestDispatcher("/spacedetail/updateSpaceDetail.jsp");
					failureView.forward(req, res);
					return; // �{�����_
				}

				/*************************** 2.�}�l�ק��� *****************************************/
				SpaceDetailService spaceDetailSvc = new SpaceDetailService();
				spaceDetailVO = spaceDetailSvc.updateSpaceDetail(spaceDetailVO);
				System.out.println(spaceDetailVO);
				/*************************** 3.�ק粒��,�ǳ����(Send the Success view) *************/
				req.setAttribute("spaceDetailVO", spaceDetailVO);
				String url = "/spacedetail/listOneSpaceDetail.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				errorMessages.add("�ק��ƥ���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/spacedetail/updateSpaceDetail.jsp");
				failureView.forward(req, res);
			}
		}

		if ("insert".equals(action)) { // addSpaceDetail.jsp
			List<String> errorMessages = new LinkedList<String>();
			 //Store this set in the request scope, in case we need to
			 //send the ErrorPage view.
			req.setAttribute("errorMessages", errorMessages);

			try {
				
				String spaceDetailId = new String(req.getParameter("spaceDetailId").trim());
				if (spaceDetailId == null || spaceDetailId.trim().length() == 0) {
					errorMessages.add("場地明細ID請勿空白");
				}
				
				String spaceId = req.getParameter("spaceId");
				if (spaceId == null || spaceId.trim().length() == 0) {
					errorMessages.add("場地ID請勿空白");
				}
				
				java.sql.Date spaceDetailFreeDate = null;
				try {
					spaceDetailFreeDate = java.sql.Date.valueOf(req.getParameter("spaceDetailFreeDate").trim());
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
					errorMessages.add("場地開放日期錯誤");
				}
				
				Integer spaceDetailCharge = null;
				try {
					spaceDetailCharge = Integer.parseInt(req.getParameter("spaceDetailCharge").trim());
					if(spaceDetailCharge <= 0) errorMessages.add("金額錯誤");
				} catch (NumberFormatException e) {
					spaceDetailCharge = 0;
					errorMessages.add("請輸入金額");
				}
				
				String spaceDetailText = new String(req.getParameter("spaceDetailText").trim());
				if (spaceDetailText == null || spaceDetailText.trim().length() == 0) {
					errorMessages.add("請輸入資料");
				}

				
				SpaceDetailVO spaceDetailVO = new SpaceDetailVO();
				spaceDetailVO.setSpaceDetailId(spaceDetailId);
				spaceDetailVO.setSpaceId(spaceId);
				spaceDetailVO.setSpaceDetailFreeDate(spaceDetailFreeDate);
				spaceDetailVO.setSpaceDetailCharge(spaceDetailCharge);
				spaceDetailVO.setSpaceDetailText(spaceDetailText);
				
				
//				 Send the use back to the form, if there were errors
				if (!errorMessages.isEmpty()) {
					req.setAttribute("spaceDetailVO", spaceDetailVO); 
					RequestDispatcher failureView = req.getRequestDispatcher("/spacedetail/addSpaceDetail.jsp");
					failureView.forward(req, res);
				}
				/*************************** 2.新增資料 ***************************************/
				SpaceDetailService spaceDetailSvc = new SpaceDetailService();
				spaceDetailVO = spaceDetailSvc.addSpaceDetail(spaceDetailVO);
				System.out.println(spaceDetailVO);
				
				/*************************** 3.資料轉交(Send the Success view) ***********/
				String url = "/spacedetail/listAllSpaceDetail.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMessages.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/spacedetail/addSpaceDetail.jsp");
				failureView.forward(req, res);
			}
		}

		if ("delete".equals(action)) { // �Ӧ�listAllSpace.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.�����ШD�Ѽ� ***************************************/
				String spaceDetailId = new String(req.getParameter("spaceDetailId"));

				/*************************** 2.�}�l�R����� ***************************************/
				SpaceDetailService spaceDetailSvc = new SpaceDetailService();
				spaceDetailSvc.deleteSpaceDetail(spaceDetailId);

				/*************************** 3.�R������,�ǳ����(Send the Success view) ***********/
				String url = "/spacedetail/listAllSpaceDetail.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/spacedetail/listAllSpaceDetail.jsp");
				failureView.forward(req, res);
			}
		}
	}
}

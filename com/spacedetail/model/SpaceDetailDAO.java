package com.spacedetail.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class SpaceDetailDAO implements SpaceDetailDAO_interface {
	
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "TEA101G2SP";
	String passwd = "123456";
	
	private static final String INSERT_STMT =
			"INSERT INTO SPACE_DETAIL VALUES (SPACE_DETAIL_ID_SEQ.NEXTVAL,?,?,?,?)";
	private static final String SELECT_ALL_STMT =
			"SELECT * FROM SPACE_DETAIL order by SPACE_DETAIL_ID";
	private static final String SELECT_ONE_STMT =
			"SELECT * FROM SPACE_DETAIL where SPACE_DETAIL_ID = ?";
	private static final String DELETE =
			"DELETE FROM SPACE_DETAIL where SPACE_DETAIL_ID = ?";
	private static final String UPDATE =
			"UPDATE SPACE_DETAIL set SPACE_ID=?,SPACE_DETAIL_FREEDATE=?,SPACE_DETAIL_CHARGE=?,SAPCE_DETAIL_TEXT? where SPACE_DETAIL_ID=?";
	
	@Override
	public void insert(SpaceDetailVO spaceDetailVO) {
		Connection con = null;
		PreparedStatement ptmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			ptmt = con.prepareStatement(INSERT_STMT);
			
			ptmt.setString(1, spaceDetailVO.getSpaceId());
			ptmt.setDate(2, spaceDetailVO.getSpaceDetailFreeDate());
			ptmt.setInt(3, spaceDetailVO.getSpaceDetailCharge());
			ptmt.setString(4, spaceDetailVO.getSpaceDetailText());
				
			ptmt.executeUpdate();
			
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if(ptmt != null) {
					try {
						ptmt.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
						e.printStackTrace(System.err);
					}
				}
			}
	}

	@Override
	public void delete(String spaceDetailId) {
		Connection con = null;
		PreparedStatement ptmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			ptmt = con.prepareStatement(DELETE);
			
			ptmt.setString(1, spaceDetailId);
			
			ptmt.executeUpdate();
			
		}catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				if (ptmt != null) {
					try {
						ptmt.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
						e.printStackTrace(System.err);
					}
				}
			}
	}

	@Override
	public void update(SpaceDetailVO spaceDetailVO) {
		Connection con = null;
		PreparedStatement ptmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			ptmt = con.prepareStatement(UPDATE);
			
			ptmt.setString(1, spaceDetailVO.getSpaceId());
			ptmt.setDate(2, spaceDetailVO.getSpaceDetailFreeDate());
			ptmt.setInt(3, spaceDetailVO.getSpaceDetailCharge());
			ptmt.setString(4, spaceDetailVO.getSpaceDetailText());
			ptmt.setString(5, spaceDetailVO.getSpaceDetailId());

			ptmt.executeUpdate();
			
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (ptmt != null) {
				try {
					ptmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public SpaceDetailVO selectOne(String spaceDetailId) {
		Connection con = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		
		SpaceDetailVO spaceDetailVO = new SpaceDetailVO();
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			ptmt = con.prepareStatement(SELECT_ONE_STMT);
			
			ptmt.setString(1, spaceDetailId);
			
			rs = ptmt.executeQuery();
			while (rs.next()) {
				spaceDetailVO.setSpaceDetailId(rs.getString("SPACE_DETAIL_ID"));
				spaceDetailVO.setSpaceId(rs.getString("SPACE_ID"));
				spaceDetailVO.setSpaceDetailFreeDate(rs.getDate("SPACE_DETAIL_FREEDATE"));
				spaceDetailVO.setSpaceDetailCharge(rs.getInt("SPACE_DETAIL_CHARGE"));
				spaceDetailVO.setSpaceDetailText(rs.getString("SPACE_DETAIL_TEXT"));
			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (ptmt != null) {
				try {
					ptmt.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return spaceDetailVO;
	}

	@Override
	public List<SpaceDetailVO> getAll() {
		Connection con = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		
		SpaceDetailVO spaceDetailVO = null;
		List<SpaceDetailVO> list = new ArrayList<SpaceDetailVO>();;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			ptmt = con.prepareStatement(SELECT_ALL_STMT);
			
			rs = ptmt.executeQuery();
			while (rs.next()) {
				spaceDetailVO = new SpaceDetailVO();
				spaceDetailVO.setSpaceDetailId(rs.getString("SPACE_DETAIL_ID"));
				spaceDetailVO.setSpaceId(rs.getString("SPACE_ID"));
				spaceDetailVO.setSpaceDetailFreeDate(rs.getDate("SPACE_DETAIL_FREEDATE"));
				spaceDetailVO.setSpaceDetailCharge(rs.getInt("SPACE_DETAIL_CHARGE"));
				spaceDetailVO.setSpaceDetailText(rs.getString("SPACE_DETAIL_TEXT"));
				
				list.add(spaceDetailVO);
			}

			}catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (ptmt != null) {
					try {
						ptmt.close();
					} catch (Exception e) {
						e.printStackTrace(System.err);
					}
				}if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
						e.printStackTrace(System.err);
					}
				}
			}
		return list;
	}
}

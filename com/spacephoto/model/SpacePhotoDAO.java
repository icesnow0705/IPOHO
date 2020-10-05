package com.spacephoto.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.spacedetail.model.SpaceDetailVO;

public class SpacePhotoDAO implements SpacePhotoDAO_interface {
	
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "TEA101G2SP";
	String passwd = "123456";
	
	private static final String INSERT_STMT =
			"INSERT INTO SPACE_PHOTO VALUES (SPACE_PHOTO_ID_SEQ.NEXTVAL,?,?)";
	private static final String SELECT_ALL_STMT =
			"SELECT * FROM SPACE_PHOTO order by SPACE_PHOTO_ID";
	private static final String SELECT_ONE_STMT =
			"SELECT * FROM SPACE_PHOTO where SPACE_PHOTO_ID = ?";
	private static final String SELECT_SPACE_STMT =
			"SELECT * FROM SPACE_PHOTO where SPACE_ID = ?"; //顯示相同spaceId所有圖片
	private static final String SELECT_ONE_SPACEPHOTO =
			"SELECT * FROM SPACE_PHOTO where SPACE_ID = ? AND ROWNUM = 1"; //顯示相同spaceId一張圖片
	private static final String DELETE =
			"DELETE FROM SPACE_PHOTO where SPACE_PHOTO_ID = ?";
	private static final String UPDATE =
			"UPDATE SPACE_PHOTO set SPACE_ID=?,SPACE_PHOTO=? where SPACE_PHOTO_ID=?";
	
	@Override
	public void insert(SpacePhotoVO spacePhotoVO) {
		Connection con = null;
		PreparedStatement ptmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			ptmt = con.prepareStatement(INSERT_STMT);
			
			ptmt.setString(1, spacePhotoVO.getSpaceId());
			ptmt.setBytes(2, spacePhotoVO.getSpacePhoto());
				
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
	public void delete(String spacePhotoId) {
		Connection con = null;
		PreparedStatement ptmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			ptmt = con.prepareStatement(DELETE);
			
			ptmt.setString(1, spacePhotoId);
			
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
	public void update(SpacePhotoVO spacePhotoVO) {
		Connection con = null;
		PreparedStatement ptmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			ptmt = con.prepareStatement(UPDATE);
			
			ptmt.setString(1, spacePhotoVO.getSpaceId());
			ptmt.setBytes(2, spacePhotoVO.getSpacePhoto());
			ptmt.setString(3, spacePhotoVO.getSpacePhotoId());

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
	public SpacePhotoVO selectOne(String spacePhotoId) {
		Connection con = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		
		SpacePhotoVO spacePhotoVO = new SpacePhotoVO();
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			ptmt = con.prepareStatement(SELECT_ONE_STMT);
			
			ptmt.setString(1, spacePhotoId);
			
			rs = ptmt.executeQuery();
			while (rs.next()) {
				spacePhotoVO.setSpacePhotoId(rs.getString("SPACE_PHOTO_ID"));
				spacePhotoVO.setSpaceId(rs.getString("SPACE_ID"));
				spacePhotoVO.setSpacePhoto(rs.getBytes("SPACE_PHOTO"));
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
		return spacePhotoVO;
	}

	@Override
	public List<SpacePhotoVO> getAll() {
		Connection con = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		
		SpacePhotoVO spacePhotoVO = null;
		List<SpacePhotoVO> list = new ArrayList<SpacePhotoVO>();;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			ptmt = con.prepareStatement(SELECT_ALL_STMT);
			
			rs = ptmt.executeQuery();
			while (rs.next()) {
				spacePhotoVO = new SpacePhotoVO();
				spacePhotoVO.setSpacePhotoId(rs.getString("SPACE_PHOTO_ID"));
				spacePhotoVO.setSpaceId(rs.getString("SPACE_ID"));
				spacePhotoVO.setSpacePhoto(rs.getBytes("SPACE_PHOTO"));
				
				list.add(spacePhotoVO);
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
	//取相同spaceId所有圖片
	@Override
	public List<SpacePhotoVO> getAllPhoto(String spaceId) {
		Connection con = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		
		SpacePhotoVO spacePhotoVO = null;
		List<SpacePhotoVO> list = new ArrayList<SpacePhotoVO>();;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			ptmt = con.prepareStatement(SELECT_SPACE_STMT);
			
			ptmt.setString(1, spaceId);
			
			rs = ptmt.executeQuery();
			while (rs.next()) {
				spacePhotoVO = new SpacePhotoVO();
				spacePhotoVO.setSpacePhotoId(rs.getString("SPACE_PHOTO_ID"));
				spacePhotoVO.setSpaceId(rs.getString("SPACE_ID"));
				spacePhotoVO.setSpacePhoto(rs.getBytes("SPACE_PHOTO"));
				
				list.add(spacePhotoVO);
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
	
	@Override
	public List<SpacePhotoVO> getDefaultPhoto(String spaceId) {
		Connection con = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		
		SpacePhotoVO spacePhotoVO = null;
		List<SpacePhotoVO> list = new ArrayList<SpacePhotoVO>();;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			ptmt = con.prepareStatement(SELECT_ONE_SPACEPHOTO);
			
			ptmt.setString(1, spaceId);
			
			rs = ptmt.executeQuery();
			while (rs.next()) {
				spacePhotoVO = new SpacePhotoVO();
				spacePhotoVO.setSpacePhotoId(rs.getString("SPACE_PHOTO_ID"));
				spacePhotoVO.setSpaceId(rs.getString("SPACE_ID"));
				spacePhotoVO.setSpacePhoto(rs.getBytes("SPACE_PHOTO"));
				
				list.add(spacePhotoVO);
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

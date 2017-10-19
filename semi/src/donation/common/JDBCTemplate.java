package donation.common;
import java.sql.*;

// �떛湲��넠
public class JDBCTemplate {
	public static Connection getConnection()
	{
		Connection con = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//con.setAutoCommit(false);
			con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "student", "student");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return con;
	}
	
	public static void close(Connection con)
	{
		try {
			if(con != null && !con.isClosed())
				con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Statement stmt)
	{
		try {
			if(stmt != null && !stmt.isClosed())
				stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rset)
	{
		try {
			if(rset != null && !rset.isClosed())
				rset.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void commit(Connection con)
	{
		try {
			if(con != null && !con.isClosed())
				con.setAutoCommit(false);
				con.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void rollback(Connection con)
	{
		try {
			if(con != null && !con.isClosed())
				con.setAutoCommit(false);
				con.rollback();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
}

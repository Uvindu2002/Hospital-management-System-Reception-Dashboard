package recep.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import com.connection.DBConnect;

public class AppoinmentDao {

	private static Connection con = null;
	private static Statement stmt = null;

	public static boolean makeAppoinment(String name, String email, String mobile, String nic, String date,
			String doctorId, String message) {

		boolean isSuccess = false;

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();

			Date todaysDate = new Date();
			DateFormat df2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			String DateAndTime = df2.format(todaysDate);

			Random random = new Random();
			int randomNumber = random.nextInt(90000) + 10000;

			String uniqueID = "app_" + randomNumber;

			String sql2 = "SELECT * FROM patient WHERE nic = '" + nic + "' AND phone = '" + mobile + "'";

			ResultSet rs = stmt.executeQuery(sql2);
			int rs1 = 0;

			if (!rs.next()) {
				String sql = "INSERT INTO patient VALUES (0,'" + name + "','" + nic + "','" + email + "','" + mobile
						+ "', '" + DateAndTime + "', 1)";

				rs1 = stmt.executeUpdate(sql);

				if (rs1 > 0) {

					String sql1 = "INSERT INTO apoinment VALUES ('" + uniqueID + "','" + date + "','" + nic + "', 1,'"
							+ doctorId + "', '" + message + "', '" + DateAndTime + "')";
					rs1 = stmt.executeUpdate(sql1);

					if (rs1 > 0) {
						isSuccess = true;
					} else {
						isSuccess = false;
					}

				}

			} else {
				String sql1 = "INSERT INTO apoinment VALUES ('" + uniqueID + "','" + date + "','" + nic + "', 1,'"
						+ doctorId + "', '" + message + "', '" + DateAndTime + "')";
				rs1 = stmt.executeUpdate(sql1);

				if (rs1 > 0) {
					isSuccess = true;
				} else {
					isSuccess = false;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

	public static boolean reshedule(String date, String appId) {

		boolean isSuccess = false;

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();

			String sql = "UPDATE apoinment SET date='" + date + "' WHERE apoinmentId = '" + appId + "'";

			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {

				isSuccess = true;

			} else {
				isSuccess = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;

	}
}

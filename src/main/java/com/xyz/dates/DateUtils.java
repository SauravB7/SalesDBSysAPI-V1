package com.xyz.dates;

import java.sql.SQLException;
import oracle.sql.TIMESTAMP;
import java.text.SimpleDateFormat;

public class DateUtils {
	public static String convertSqlTimeStamptToString (TIMESTAMP timestamp, String format) {
		if(timestamp == null) {
			return null;
		}
		
		final SimpleDateFormat sdf = new SimpleDateFormat(format);
		try {
			return sdf.format(timestamp.timestampValue());
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}

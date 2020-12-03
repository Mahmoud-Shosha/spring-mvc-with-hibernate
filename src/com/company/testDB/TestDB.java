package com.company.testDB;

import java.sql.Connection;
import java.sql.DriverManager;

public class TestDB {

	public static void main(String[] args) {
		
		String url = "jdbc:postgresql://localhost:5432/postgres";
        String user = "postgres";
        String password = "postgres";
        try {
            Connection conn = DriverManager.getConnection(url, user, password);
            conn.close();
            System.out.println("Connected successfully");
        } catch (Exception e) {
            e.printStackTrace();
        }

	}

}

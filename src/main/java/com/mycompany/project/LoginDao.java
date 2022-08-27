package com.mycompany.project;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class LoginDao {

    public String authenticateUser(LoginBean loginBean) {
        String username = loginBean.getUserName();
        String password = loginBean.getPassword();

        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;

        String userNameDB = "";
        String passwordDB = "";
        String roleDB = "";

        try {
            con = DBConnection.createConnection();
            statement = con.createStatement();
            resultSet = statement.executeQuery("select USERNAME,PASSWORD,ROLE from users");

            while (resultSet.next()) {
                userNameDB = resultSet.getString("username");
                passwordDB = resultSet.getString("password");
                roleDB = resultSet.getString("role");

                if (username.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("Admin")) {
                    return "Admin_Role";
                } else if (username.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("Editor")) {
                    return "Editor_Role";
                } else if (username.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("User")) {
                    return "User_Role";
                }
            }
            
            con.close();
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
        return "Invalid user credentials";
    }
}

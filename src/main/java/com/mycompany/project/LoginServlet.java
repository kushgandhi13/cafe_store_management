
package com.mycompany.project;

import java.io.IOException;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
 
public class LoginServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
 
public LoginServlet() {
}
 
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
{
    String username = request.getParameter("username");
    String password = request.getParameter("password");
 
    LoginBean loginBean = new LoginBean();
 
    loginBean.setUserName(username);
    loginBean.setPassword(password);
 
    LoginDao loginDao = new LoginDao();
 
    try
    {
        String userValidate = loginDao.authenticateUser(loginBean);
        
 
        if(userValidate.equals("Admin_Role"))
        {
            System.out.println("Admin's Home");
 
            HttpSession session = request.getSession(); //Creating a session
            session.setAttribute("Admin", username); //setting session attribute
            session.setAttribute("username", username);
            
            response.sendRedirect("admin.jsp");
//            session.removeAttribute("Admin");
//            session.removeAttribute("username");
        }
        else if(userValidate.equals("Editor_Role"))
        {
            System.out.println("Editor's Home");
 
            HttpSession session = request.getSession();
            session.setAttribute("Editor", username);
            session.setAttribute("username", username);
            
            response.sendRedirect("editor.jsp");
            
//            session.removeAttribute("Editor");
//            session.removeAttribute("username");
        }
        else if(userValidate.equals("User_Role"))
        {
            System.out.println("User's Home");
 
            HttpSession session = request.getSession();
            session.setMaxInactiveInterval(10*60);
            session.setAttribute("User", username);
            session.setAttribute("username", username);
            
            response.sendRedirect("user.jsp");
//            session.removeAttribute("User");
//            session.removeAttribute("username");
        }
        else
        {
            System.out.println("Error message = "+userValidate);
            request.setAttribute("errMessage", userValidate);
            response.sendRedirect("Login.jsp");
            
        }
    }
    catch (IOException e1)
    {
        e1.printStackTrace();
    }
    catch (Exception e2)
    {
        e2.printStackTrace();
    }
} //End of doPost()


    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
    {

         System.out.println("HEllo");
         
    }
}
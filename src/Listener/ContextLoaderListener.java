package Listener;

//import com.member.model.MemberDao;
//import javax.naming.InitialContext;
//import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
//import javax.sql.DataSource;
//import com.member.controller.*;

@WebListener
public class ContextLoaderListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent event) {
		
		try {
			/**ServletContext sc = event.getServletContext();  
			InitialContext initialContext = new InitialContext();
			DataSource ds = (DataSource)initialContext.lookup("java:comp/env/jdbc/anidb");
			System.out.println("ds");
			MemberDao MemberDao = new MemberDao();
			
			MemberDao.setDataSource(ds);
			**/
			
		/**	sc.setAttribute("/MemberLogin.do", 
			          new MemberLoginController().setMemberDao(MemberDao));
			
			sc.setAttribute("/MemberJoin.do", 
			          new MemberJoinController().setMemberDao(MemberDao));
			**/
			
			} catch(Throwable e) {
		      e.printStackTrace();
		    }
		  
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	
}

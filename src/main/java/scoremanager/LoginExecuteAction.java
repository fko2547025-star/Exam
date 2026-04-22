package scoremanager;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import bean.Teacher;
import dao.TeacherDao;
import tool.Action;

public class LoginExecuteAction extends Action {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        String id = request.getParameter("id");
        String password = request.getParameter("password");

        TeacherDao dao = new TeacherDao();
        Teacher teacher = dao.login(id, password);

        if (teacher == null) {
            request.setAttribute("error", "IDまたはパスワードが違います");
            request.getRequestDispatcher("/scoremanager/login.jsp")
                   .forward(request, response);
            return;
        }

        HttpSession session = request.getSession();
        session.setAttribute("loginUser", teacher);
        session.setAttribute("loginUserName", teacher.getName());

        response.sendRedirect(request.getContextPath() + "/scoremanager/menu.jsp");

    }
}

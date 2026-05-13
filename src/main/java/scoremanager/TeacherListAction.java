package scoremanager;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import bean.School;
import bean.Teacher;
import dao.TeacherDao;
import tool.Action;

public class TeacherListAction extends Action {
    public void execute(
        HttpServletRequest request, HttpServletResponse response
    ) throws Exception {

        HttpSession session = request.getSession();
        Teacher teacher = (Teacher) session.getAttribute("user");
        
        

        if (teacher == null || !teacher.isAuthenticated()) {
            request.getRequestDispatcher("/scoremanager/main/login.jsp")
                   .forward(request, response);
            return;
        }

        School school = teacher.getSchool();
        
        
        String keyword = request.getParameter("keyword");
        String sort = request.getParameter("sort");

        TeacherDao dao = new TeacherDao();
        List<Teacher> list;

        if (keyword != null && !keyword.isEmpty()) {
            list = dao.search(school, keyword, sort);
        } else {
            list = dao.filter(school, sort);
        }

        request.setAttribute("list", list);
        request.setAttribute("keyword", keyword);
        request.setAttribute("sort", sort);



        request.getRequestDispatcher("/scoremanager/main/teacher_list.jsp")
               .forward(request, response);
    }
}

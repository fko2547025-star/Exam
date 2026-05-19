package scoremanager;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import bean.School;
import bean.Subject;
import bean.Teacher;
import dao.SubjectDao;
import tool.Action;

public class SubjectListAction extends Action {
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

        School school = (School)session.getAttribute("school");

        String keyword = request.getParameter("keyword");
        SubjectDao dao = new SubjectDao();
        List<Subject> list;

        if (keyword != null && !keyword.isBlank()) {
            list = dao.search(school, keyword);
        } else {
            list = dao.filter(school);
        }

        request.setAttribute("list", list);
        request.setAttribute("count", list.size());  // ★ 追加

        request.getRequestDispatcher("/scoremanager/main/subject_list.jsp")
               .forward(request, response);
    }
}

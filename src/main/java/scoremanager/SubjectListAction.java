package scoremanager;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import bean.School;
import bean.Subject;
import dao.SubjectDao;
import tool.Action;

public class SubjectListAction extends Action {
    public void execute(
        HttpServletRequest request, HttpServletResponse response
    ) throws Exception {

        HttpSession session = request.getSession();
        School school = (School)session.getAttribute("school");

        System.out.println("school = " + school);
        SubjectDao dao = new SubjectDao();
        List<Subject> list = dao.filter(school);

        request.setAttribute("list", list);

        request.getRequestDispatcher("subject_list.jsp").forward(request, response);
    }
}


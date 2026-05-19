package scoremanager;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import bean.School;
import dao.SubjectDao;
import tool.Action;

public class SubjectMultiDeleteAction extends Action {
    public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

        HttpSession session = req.getSession();
        School school = (School)session.getAttribute("school");

        String[] cdList = req.getParameterValues("cdList");

        if (cdList != null) {
            SubjectDao dao = new SubjectDao();

            for (String cd : cdList) {
                dao.deleteByCd(school.getCd(), cd);
            }
        }

        req.getRequestDispatcher("subject_delete_done.jsp").forward(req, res);
    }
}

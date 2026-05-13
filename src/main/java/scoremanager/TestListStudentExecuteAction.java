package scoremanager;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import bean.Student;
import bean.Teacher;
import bean.TestListStudent;
import dao.StudentDao;
import dao.TestListStudentDao;

<<<<<<< HEAD
@WebServlet("/scoremanager/main/TestListStudentExecute.action")
public class TestListStudentExecuteAction extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        // 修正案：属性名を "user" に統一
        Teacher teacher = (Teacher) session.getAttribute("user");

        if (teacher == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        String studentNo = req.getParameter("studentNo");

        try {
            // シーケンス図に基づき、まずは学生の存在を確認
            StudentDao sDao = new StudentDao();
            Student student = sDao.get(studentNo);

            if (student != null) {
                // 学生が存在する場合、成績一覧（科目横断）を取得
                TestListStudentDao dao = new TestListStudentDao();
                List<TestListStudent> list = dao.filter(student);
                
                req.setAttribute("student", student);
                req.setAttribute("list", list);
            } else {
                req.setAttribute("error", "学生情報が見つかりませんでした");
            }

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "システムエラーが発生しました");
        }

        // パス構成：webapp/scoremanager/main/test_list_student.jsp
=======
/**
 * 学生別成績一覧表示アクション
 */
@WebServlet("/scoremanager/main/TestListStudentExecute.action")
public class TestListStudentExecuteAction extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        // セッション属性名を "user" に統一 [修正案1反映]
        Teacher teacher = (Teacher) session.getAttribute("user");

        if (teacher == null) {
            resp.sendRedirect(req.getContextPath() + "/scoremanager/main/login.jsp");
            return;
        }

        String studentNo = req.getParameter("studentNo");
        
        // 入力チェック
        if (studentNo == null || studentNo.isEmpty()) {
            req.setAttribute("error", "学生番号を入力してください");
            req.getRequestDispatcher("TestList.action").forward(req, resp);
            return;
        }

        try {
            StudentDao sDao = new StudentDao();
            Student student = sDao.get(studentNo); // 学生情報の取得

            if (student != null) {
                TestListStudentDao dao = new TestListStudentDao();
                // ログインユーザーの学校に所属するデータのみに制限
                List<TestListStudent> list = dao.filter(student);
                
                req.setAttribute("student", student);
                req.setAttribute("list", list);
            } else {
                req.setAttribute("error", "学生情報が見つかりませんでした");
            }

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "システムエラーが発生しました");
        }

        // JSPへフォワード
>>>>>>> branch 'master' of https://github.com/fko2547025-star/Exam.git
        req.getRequestDispatcher("/scoremanager/main/test_list_student.jsp").forward(req, resp);
    }
}
package scoremanager;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import bean.Subject;
import bean.Teacher;
import bean.TestListSubject;
import dao.SubjectDao;
import dao.TestListSubjectDao;

<<<<<<< HEAD
@WebServlet("/scoremanager/main/TestListSubjectExecute.action")
public class TestListSubjectExecuteAction extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        Teacher teacher = (Teacher) session.getAttribute("user");

        if (teacher == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        String entYearStr = req.getParameter("entYear");
        String classNum = req.getParameter("classNum");
        String subjectCd = req.getParameter("subjectCd");

        try {
            // 入力バリデーション [修正案反映]
            if (entYearStr == null || subjectCd == null || subjectCd.isEmpty()) {
                throw new Exception("必須項目を選択してください");
            }

            int entYear = Integer.parseInt(entYearStr);

            // シーケンス図に基づき、まず科目の妥当性をDAOで確認
            SubjectDao subjectDao = new SubjectDao();
            Subject subject = subjectDao.get(subjectCd, teacher.getSchool());

            if (subject != null) {
                // 科目情報を元に、指定クラス全員の10回分の成績を取得
                TestListSubjectDao dao = new TestListSubjectDao();
                List<TestListSubject> list = dao.filter(entYear, classNum, subject, teacher.getSchool());

                req.setAttribute("subject", subject);
                req.setAttribute("entYear", entYear);
                req.setAttribute("classNum", classNum);
                req.setAttribute("list", list);
            } else {
                req.setAttribute("error", "科目情報が正しく取得できませんでした");
            }

        } catch (NumberFormatException e) {
            req.setAttribute("error", "入学年度の形式が不正です");
        } catch (Exception e) {
            req.setAttribute("error", e.getMessage());
=======
/**
 * 科目別成績一覧表示アクション
 */
@WebServlet("/scoremanager/main/TestListSubjectExecute.action")
public class TestListSubjectExecuteAction extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        Teacher teacher = (Teacher) session.getAttribute("user");

        if (teacher == null) {
            resp.sendRedirect(req.getContextPath() + "/scoremanager/main/login.jsp");
            return;
        }

        // パラメータ取得
        String entYearStr = req.getParameter("entYear");
        String classNum = req.getParameter("classNum");
        String subjectCd = req.getParameter("subjectCd");

        try {
            // 数値変換の例外処理 [修正案2反映]
            int entYear = 0;
            if (entYearStr != null && !entYearStr.isEmpty()) {
                entYear = Integer.parseInt(entYearStr);
            }

            // Subjectオブジェクトの取得
            SubjectDao subjectDao = new SubjectDao();
            Subject subject = subjectDao.get(subjectCd, teacher.getSchool());

            if (subject != null) {
                // DAO呼び出し
                TestListSubjectDao dao = new TestListSubjectDao();
                List<TestListSubject> list = dao.filter(entYear, classNum, subject, teacher.getSchool());

                req.setAttribute("subject", subject);
                req.setAttribute("entYear", entYear);
                req.setAttribute("classNum", classNum);
                req.setAttribute("list", list);
            } else {
                req.setAttribute("error", "科目が指定されていないか、存在しません");
            }

        } catch (NumberFormatException e) {
            req.setAttribute("error", "入学年度が正しくありません");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "データ取得中にエラーが発生しました");
>>>>>>> branch 'master' of https://github.com/fko2547025-star/Exam.git
        }

        req.getRequestDispatcher("/scoremanager/main/test_list_subject.jsp").forward(req, resp);
    }
}
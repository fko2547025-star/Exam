package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.School;
import bean.Teacher;

public class TeacherDao extends Dao {

    public Teacher get(String id) {
        Teacher teacher = null;

        String sql = "SELECT ID, PASSWORD, NAME, SCHOOL_CD FROM TEACHER WHERE ID = ?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    teacher = new Teacher();
                    teacher.setId(rs.getString("ID"));
                    teacher.setPassword(rs.getString("PASSWORD"));
                    teacher.setName(rs.getString("NAME"));

                    School school = new School();
                    school.setCd(rs.getString("SCHOOL_CD"));
                    teacher.setSchool(school);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return teacher;
    }

    public Teacher login(String id, String password) {
        Teacher teacher = null;

        String sql = "SELECT ID, PASSWORD, NAME, SCHOOL_CD FROM TEACHER WHERE ID = ? AND PASSWORD = ?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, id);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    teacher = new Teacher();
                    teacher.setId(rs.getString("ID"));
                    teacher.setPassword(rs.getString("PASSWORD"));
                    teacher.setName(rs.getString("NAME"));

                    School school = new School();
                    school.setCd(rs.getString("SCHOOL_CD"));
                    teacher.setSchool(school);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return teacher;
    }
}

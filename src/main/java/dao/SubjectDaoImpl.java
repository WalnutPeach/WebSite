package dao;

import db.ConnectionFactory;
import model.Subject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SubjectDaoImpl implements SubjectDao {
    @Override
    public List<Subject> listSubjects() {

        List<Subject> list = new ArrayList<>();
        ResultSet resultSet;

        try (Connection connection = ConnectionFactory.getConnection()) {
            resultSet = connection.createStatement().executeQuery("select a.id, a.courses, l.name, l.surname, a.lecturer_id, a.credits from subjects a inner join lecturers l on l.id = a.lecturer_id order by id");
            while (resultSet.next()) {
                Subject subject = new Subject();
                subject.setId(resultSet.getInt("id"));
                subject.setCredits(resultSet.getInt("credits"));
                subject.setCourses(resultSet.getString("courses"));
                subject.setLecturerId(resultSet.getInt("lecturer_id"));
                String lecturer =
                        resultSet.getString("name") + " " +
                        resultSet.getString("surname");
                subject.setLecturer(lecturer);
                list.add(subject);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    @Override
    public void saveSubject(Subject subject) {
        try (Connection connection = ConnectionFactory.getConnection()) {
            PreparedStatement pst;
            pst = connection.prepareStatement("insert into subjects(courses, lecturer_id, credits) values (?,?,?)");
            pst.setString(1, subject.getCourses());
            pst.setInt(2, subject.getLecturerId());
            pst.setInt(3, subject.getCredits());
            pst.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void updateSubject(Subject subject) {
        try (Connection connection = ConnectionFactory.getConnection()) {
            PreparedStatement pst;
            pst = connection.prepareStatement("update subjects set courses = ?, lecturer_id = ?, credits = ? where id = ?");
            pst.setString(1, subject.getCourses());
            pst.setInt(2, subject.getLecturerId());
            pst.setInt(3, subject.getCredits());
            pst.setInt(4, subject.getId());
            pst.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public Subject getSubjectById(int id) {
        ResultSet resultSet;
        try (Connection connection = ConnectionFactory.getConnection()) {
            PreparedStatement pst =
                    connection.prepareStatement("select a.id, a.courses, l.name, l.surname, a.lecturer_id, a.credits " +
                            "from subjects a inner join lecturers l on l.id = a.lecturer_id where a.id=?");
            pst.setInt(1, id);
            resultSet = pst.executeQuery();
            while (resultSet.next()) {
                Subject subject = new Subject();
                subject.setId(resultSet.getInt("id"));
                subject.setCredits(resultSet.getInt("credits"));
                subject.setCourses(resultSet.getString("courses"));
                subject.setLecturerId(resultSet.getInt("lecturer_id"));
                String lecturer =
                        resultSet.getString("name") + " " +
                                resultSet.getString("surname");
                subject.setLecturer(lecturer);
                return subject;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return new Subject();
    }
}

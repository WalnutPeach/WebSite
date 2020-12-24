package model;

public class Subject {
    private int id;
    private String courses;
    private String lecturer;
    private int lecturerId;
    private int credits;

    public Subject() {
    }

    public Subject(int id, String courses, int lecturerId, int credits) {
        this.id = id;
        this.courses = courses;
        this.lecturerId = lecturerId;
        this.credits = credits;
    }

    public int getLecturerId() {
        return lecturerId;
    }

    public void setLecturerId(int lecturerId) {
        this.lecturerId = lecturerId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCourses() {
        return courses;
    }

    public void setCourses(String courses) {
        this.courses = courses;
    }

    public String getLecturer() {
        return lecturer;
    }

    public void setLecturer(String lecturer) {
        this.lecturer = lecturer;
    }

    public int getCredits() {
        return credits;
    }

    public void setCredits(int credits) {
        this.credits = credits;
    }
}

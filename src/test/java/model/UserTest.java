package model;

import org.junit.Test;

import static org.junit.Assert.*;

public class UserTest {

    @Test
    public void getId() {
        User user = new User();
        int expectedID = 5;
        user.setId(expectedID);
        int id = user.getId();
        assertEquals(expectedID, id);
    }

    @Test
    public void getPassword() {
    }
}
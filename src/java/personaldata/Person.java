/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package personaldata;

import java.util.List;

/**
 *
 * @author Νικόλαος Μπέλλιας
 */
public class Person {
    
    private String name;
    private String email;
    private String phonenumber;
    private String birthday;
    private String message;
    
    public Person() {
    }

    public Person(String name, String email, String phonenumber, String birthday, String message) {
        this.name = name;
        this.email = email;
        this.phonenumber = phonenumber;
        this.birthday = birthday;
        this.message = message;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public String toString() {
        return "<h3>Person</h3>" + "<p>name=" + name + ", email=" + email + ", phonenumber=" + phonenumber + ", birthday=" + birthday + ", message=" + message + "</p>";
    }
    
    
    
}

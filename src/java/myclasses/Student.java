/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myclasses;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Νικόλαος Μπέλλιας
 */
public class Student {
    private String name;
    private Long id;

    public Student() {
    }

    public Student(String name, Long id) {
        this.name = name;
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    
    public List<Student> fetchStudentsFromDatabase(){
        List<Student> studentList = new ArrayList();
        studentList.add(new Student("Maria", 1L));
        studentList.add(new Student("Nikos", 2L));
        studentList.add(new Student("Maria", 3L));
        studentList.add(new Student("Kostas", 4L));
        studentList.add(new Student("Eleana", 5L));
        studentList.add(new Student("Anna", 6L));
        studentList.add(new Student("Giannis", 7L));
        studentList.add(new Student("Andreas", 8L));
        
        return studentList;
    }
}

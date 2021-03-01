package com.alkemy.challenge.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "teacher")
public class Teacher {
    
    @Id
    @Column(name = "id_teacher")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Column(length=150, nullable = false)
    private String name;
    
    @Column(length=250, nullable = false)
    private String last_name;
    
    @Column(length=50, nullable = false)
    private String dni;
    
    @Column(length=20, nullable = false)
    private String status;

    public int getId() {
        return id;
    }

    public void setId(int id_teacher) {
        this.id = id_teacher;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
    

}

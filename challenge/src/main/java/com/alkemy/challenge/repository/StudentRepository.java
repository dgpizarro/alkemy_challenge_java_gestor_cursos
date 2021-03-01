package com.alkemy.challenge.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.alkemy.challenge.entity.Student;

public interface StudentRepository extends JpaRepository <Student, Integer> {
    
    public Student findByDni(String dni);

}

package com.alkemy.challenge.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.alkemy.challenge.entity.Teacher;

public interface TeacherRepository extends JpaRepository<Teacher, Integer> {
    
    public List<Teacher> findByOrderByIdAsc();
}

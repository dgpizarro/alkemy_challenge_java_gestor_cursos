package com.alkemy.challenge.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alkemy.challenge.entity.Student;
import com.alkemy.challenge.repository.StudentRepository;

@Service
public class StudentServiceImpl implements StudentService{
    
    @Autowired
    private StudentRepository sr;

    @Override
    public Student buscarEstudianteByDni(String dni) {
        return sr.findByDni(dni);
    }

    @Override
    public Optional<Student> buscarEstudianteById(int id) {
        return sr.findById(id);
    }

    @Override
    public Student agregarEditarEstudiante(Student student) {
        return sr.save(student);
    }
    
    
    

}

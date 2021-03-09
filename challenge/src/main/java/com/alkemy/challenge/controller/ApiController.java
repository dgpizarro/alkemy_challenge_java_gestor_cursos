package com.alkemy.challenge.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alkemy.challenge.entity.Course;
import com.alkemy.challenge.service.CourseService;



@RestController
@RequestMapping(value = "/estudiante/api", headers = "Accept=application/json")
public class ApiController {
    
    @Autowired
    private CourseService cs;
    
    @GetMapping("/curso/{id_course}")
    public Course detallarCurso(@PathVariable int id_course){
        return cs.buscarCursoById(id_course).get();
    }
    
}

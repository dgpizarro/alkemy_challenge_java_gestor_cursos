package com.alkemy.challenge.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alkemy.challenge.entity.Teacher;
import com.alkemy.challenge.repository.TeacherRepository;

@Service
public class TeacherServiceImpl implements TeacherService {

    @Autowired
    private TeacherRepository tr;

    @Override
    public List<Teacher> listarProfesores() {
        return tr.findByOrderByIdAsc();
    }

    @Override
    public Teacher agregarEditarProfesor(Teacher t) {
        return tr.save(t);
    }

    @Override
    public Optional<Teacher> buscarProfesorById(int id) {
        return tr.findById(id);
    }

    @Override
    public void eliminarProfesor(int id) {
        tr.deleteById(id);

    }

    @Override
    public long totalProfesores() {
        return tr.count();
    }

}

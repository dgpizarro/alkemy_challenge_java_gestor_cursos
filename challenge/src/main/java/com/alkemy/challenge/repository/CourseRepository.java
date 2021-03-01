package com.alkemy.challenge.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.alkemy.challenge.entity.Course;
import com.alkemy.challenge.entity.ICoursesCount;
import com.alkemy.challenge.entity.Teacher;

public interface CourseRepository extends JpaRepository<Course, Integer> {
    
    public List<Course> findByOrderByIdAsc();
    public List<Course> findByDayAndModuleAndTeacher(String day, String module, Teacher teacher);
    public Optional<Course> findByDayAndModuleAndStudents_Id(String day, String module, int id);
    public List<Course> findByTeacherOrderByNameAsc(Teacher teacher);
    public List<Course> findByStudents_IdOrderByNameAsc(int id);
    
    @Query(value = "SELECT c.id_course AS idCurso, c.name AS nombreCurso, c.schedule_day AS dia, " +
            "c.schedule_module AS modulo, c.max_students AS maximo, t.name AS nombreT, " + 
            "t.last_name AS apellidoT, COUNT(e.id_student) AS inscritos FROM course AS c INNER JOIN teacher AS t ON (c.id_teacher = t.id_teacher) " + 
            "LEFT JOIN enrollment AS e ON (c.id_course = e.id_course) GROUP BY c.id_course, c.name, c.schedule_day, " + 
            "c.schedule_module, c.max_students, c.description, t.name, t.last_name ORDER BY c.name", nativeQuery = true)
    public List<ICoursesCount> findCoursesAndCount();
    
}

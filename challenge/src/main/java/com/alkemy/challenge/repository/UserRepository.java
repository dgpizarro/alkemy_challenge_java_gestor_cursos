package com.alkemy.challenge.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.alkemy.challenge.entity.User;

public interface UserRepository extends JpaRepository<User, Integer> {

    User findByUsername(String username);

}

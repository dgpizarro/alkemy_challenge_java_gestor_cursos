package com.alkemy.challenge.entity;

import java.util.Set;

import javax.persistence.*;



@Entity
@Table(name = "user_entity")
public class User {
    
    @Id
    @Column(name = "id_user")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Column(length=50, nullable = false)
    private String username;
    
    @Column(length=250, nullable = false)
    private String password;
    
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name="user_roles", joinColumns= @JoinColumn (name="id_user")
            ,inverseJoinColumns=@JoinColumn(name="id_role"))
    private Set<Role> roles;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }
    
    
    
    
}

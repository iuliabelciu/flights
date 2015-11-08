
package com.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="USER_TABLE")
public class User implements Serializable {
    
    @Id @GeneratedValue
    private Long id;
    private String firstName;
    private String type;
    private String lastName;
    private String email;
    private String username;
    private String password;

    public User() {
    }

    
    public User(String firstName, String type, String lastName, String email, String username, String password) {
        this.firstName = firstName;
        this.type = type;
        this.lastName = lastName;
        this.email = email;
        this.username = username;
        this.password = password;
    }


    public Long getId() {
        return id;
    }

     public void setId(Long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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
}

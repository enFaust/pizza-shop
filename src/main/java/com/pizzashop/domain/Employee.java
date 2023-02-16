package com.pizzashop.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

import javax.persistence.*;

@SuperBuilder
@Setter
@Getter
@NoArgsConstructor
@Entity
@Table(name = "employees")
public class Employee {
    @Id
    private int id;
    private String name;
    private String phoneNumber;
    private String email;
    private String jobTitle;
}
package com.pizzashop.domain;

import lombok.Builder;
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
@Table(name = "customers")
public class Customer {
    @Id
    private int id;
    private String name;
    private String phoneNumber;
    private String email;
}
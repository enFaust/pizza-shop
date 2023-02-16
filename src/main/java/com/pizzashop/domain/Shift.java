package com.pizzashop.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

import javax.persistence.*;
import java.time.LocalTime;

@SuperBuilder
@Setter
@Getter
@NoArgsConstructor
@Entity
@Table(name = "shifts")
public class Shift {
    @Id
    private int id;
    @ManyToOne
    @JoinColumn(name = "employee_id")
    private Employee employee;
    private LocalTime startTime;
    private LocalTime endTime;
}
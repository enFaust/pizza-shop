package com.pizzashop.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;

@SuperBuilder
@Setter
@Getter
@NoArgsConstructor
@Entity
@Table(name = "orders")
public class Order {
    @Id
    private int id;
    @ManyToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;
    private LocalDate orderDate;
    private LocalTime orderTime;
}

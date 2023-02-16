package com.pizzashop.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;

@SuperBuilder
@Setter
@Getter
@NoArgsConstructor
@Entity
@Table(name = "pizzas")
public class Pizza {
    @Id
    private int id;
    private String name;
    private String description;
    private BigDecimal price;
    @ManyToMany
    @JoinTable(name = "pizza_toppings",
            joinColumns = @JoinColumn(name = "pizza_id"),
            inverseJoinColumns = @JoinColumn(name = "topping_id"))
    private List<Topping> toppings;
}
package com.pizzashop.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

import javax.persistence.*;
import java.math.BigDecimal;

@SuperBuilder
@Setter
@Getter
@NoArgsConstructor
@Entity
@Table(name = "toppings")
public class Topping {
    @Id
    private int id;
    private String name;
    private BigDecimal price;
}
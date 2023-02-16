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
@Table(name = "sales")
public class Sale {
    @Id
    private int id;
    @ManyToOne
    @JoinColumn(name = "order_id")
    private Order order;
    @ManyToOne
    @JoinColumn(name = "pizza_id")
    private Pizza pizza;
    private BigDecimal price;
    private int quantity;
}
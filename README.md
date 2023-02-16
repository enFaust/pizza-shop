# pizza-shop

## Data Base

customers: contains information about the customers who order pizza
```sql
customer_id (primary key)
first_name
last_name
email
phone_number
```

orders: contains information about the orders placed by customers
```sql
order_id (primary key)
customer_id (foreign key)
order_time
delivery_time
total_price
```

pizzas: contains information about the different types of pizzas available
```sql
pizza_id (primary key)
name
description
price
```

toppings: contains information about the different toppings available for pizzas
```sql
topping_id (primary key)
name
price
```

order_pizzas: contains information about which pizzas were included in each order
```sql
order_id (foreign key)
pizza_id (foreign key)
quantity
```

order_toppings: contains information about which toppings were included on each pizza in each order
```sql
order_id (foreign key)
pizza_id (foreign key)
topping_id (foreign key)
```

employees: contains information about the employees who work at the pizza shop
```sql
employee_id (primary key)
first_name
last_name
email
phone_number
hire_date
job_title
hourly_rate
```

shifts: contains information about the shifts worked by each employee
```sql
shift_id (primary key)
employee_id (foreign key)
start_time
end_time
```
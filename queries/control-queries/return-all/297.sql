select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,date_dim d,customer c,customer_address a
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and d.d_hash >= 318 and d.d_hash <= 651 and c.c_hash >= 81 and c.c_hash <= 481 and a.ca_hash >= 187 and a.ca_hash <= 937
;

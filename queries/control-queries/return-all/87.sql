select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,item i,date_dim d,customer c
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 19 and cs.cs_hash <= 769 and d.d_hash >= 377 and d.d_hash <= 777 and c.c_hash >= 171 and c.c_hash <= 504
;

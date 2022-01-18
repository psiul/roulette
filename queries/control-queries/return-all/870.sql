select count(cs.cs_item_sk)
from catalog_sales cs,item i,date_dim d,warehouse w,customer c
where cs.cs_item_sk = i.i_item_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_customer_sk = c.c_customer_sk and i.i_hash >= 238 and i.i_hash <= 638 and d.d_hash >= 654 and d.d_hash <= 987 and c.c_hash >= 177 and c.c_hash <= 927
;

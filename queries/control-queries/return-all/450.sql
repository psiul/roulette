select count(cs.cs_item_sk)
from catalog_sales cs,item i,warehouse w,date_dim d,customer c
where cs.cs_item_sk = i.i_item_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and i.i_hash >= 189 and i.i_hash <= 939 and d.d_hash >= 587 and d.d_hash <= 920 and c.c_hash >= 527 and c.c_hash <= 927
;

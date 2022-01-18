select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,item i,warehouse w,customer c
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_customer_sk = c.c_customer_sk and d.d_hash >= 280 and d.d_hash <= 680 and i.i_hash >= 18 and i.i_hash <= 768 and c.c_hash >= 480 and c.c_hash <= 813
;

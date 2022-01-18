select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,warehouse w,item i,customer c
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 56 and cs.cs_hash <= 806 and d.d_hash >= 530 and d.d_hash <= 863 and i.i_hash >= 5 and i.i_hash <= 405
;

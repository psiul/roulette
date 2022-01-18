select count(cs.cs_item_sk)
from catalog_sales cs,item i,catalog_returns cr,date_dim d,customer c
where cs.cs_item_sk = i.i_item_sk and cs.cs_order_number = cr.cr_order_number and cr.cr_returned_date_sk = d.d_date_sk and cr.cr_refunded_customer_sk = c.c_customer_sk and cs.cs_hash >= 21 and cs.cs_hash <= 771 and i.i_hash >= 442 and i.i_hash <= 842 and c.c_hash >= 541 and c.c_hash <= 874
;

select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer c,item i,catalog_returns cr
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_order_number = cr.cr_order_number and d.d_hash >= 117 and d.d_hash <= 450 and c.c_hash >= 227 and c.c_hash <= 977 and i.i_hash >= 9 and i.i_hash <= 409
;

select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,catalog_returns cr,customer c,customer_demographics cd
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_order_number = cr.cr_order_number and cr.cr_refunded_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 499 and cs.cs_hash <= 899 and d.d_hash >= 656 and d.d_hash <= 989 and c.c_hash >= 92 and c.c_hash <= 842
;

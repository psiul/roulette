select count(cs.cs_item_sk)
from catalog_sales cs,customer c,date_dim d,customer_demographics cd,catalog_returns cr
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_order_number = cr.cr_order_number and c.c_hash >= 112 and c.c_hash <= 445 and d.d_hash >= 413 and d.d_hash <= 813 and cd.cd_hash >= 56 and cd.cd_hash <= 806
;

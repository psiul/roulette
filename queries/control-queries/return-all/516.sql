select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,catalog_returns cr,customer c,date_dim d
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_bill_customer_sk = c.c_customer_sk and cr.cr_returned_date_sk = d.d_date_sk and cs.cs_hash >= 155 and cs.cs_hash <= 905 and c.c_hash >= 449 and c.c_hash <= 782 and d.d_hash >= 591 and d.d_hash <= 991
;

select count(cs.cs_item_sk)
from catalog_sales cs,customer c,catalog_returns cr,date_dim d,customer_demographics cd
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_order_number = cr.cr_order_number and cr.cr_returned_date_sk = d.d_date_sk and cr.cr_refunded_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 214 and cs.cs_hash <= 547 and d.d_hash >= 597 and d.d_hash <= 997 and cd.cd_hash >= 137 and cd.cd_hash <= 887
;

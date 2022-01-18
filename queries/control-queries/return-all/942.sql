select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,customer_demographics cd,customer c,item i
where cs.cs_order_number = cr.cr_order_number and cr.cr_refunded_cdemo_sk = cd.cd_demo_sk and cr.cr_refunded_customer_sk = c.c_customer_sk and cr.cr_item_sk = i.i_item_sk and cd.cd_hash >= 587 and cd.cd_hash <= 987 and c.c_hash >= 39 and c.c_hash <= 789 and i.i_hash >= 436 and i.i_hash <= 769
;

select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer c,catalog_returns cr,customer_demographics cd
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_order_number = cr.cr_order_number and c.c_current_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 439 and d.d_hash <= 772 and c.c_hash >= 160 and c.c_hash <= 910 and cd.cd_hash >= 201 and cd.cd_hash <= 601
;

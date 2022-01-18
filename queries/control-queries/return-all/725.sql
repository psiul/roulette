select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,catalog_returns cr,customer_demographics cd,item i
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cr.cr_item_sk = i.i_item_sk and cs.cs_hash >= 220 and cs.cs_hash <= 620 and d.d_hash >= 362 and d.d_hash <= 695 and i.i_hash >= 237 and i.i_hash <= 987
;

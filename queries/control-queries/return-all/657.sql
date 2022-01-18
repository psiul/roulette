select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,customer_demographics cd,date_dim d,item i
where cs.cs_order_number = cr.cr_order_number and cr.cr_refunded_cdemo_sk = cd.cd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 276 and cs.cs_hash <= 609 and cd.cd_hash >= 215 and cd.cd_hash <= 965 and d.d_hash >= 51 and d.d_hash <= 451
;

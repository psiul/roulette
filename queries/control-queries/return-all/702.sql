select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,date_dim d,item i,customer_demographics cd
where cs.cs_order_number = cr.cr_order_number and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cr.cr_refunded_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 393 and d.d_hash <= 726 and i.i_hash >= 469 and i.i_hash <= 869 and cd.cd_hash >= 75 and cd.cd_hash <= 825
;

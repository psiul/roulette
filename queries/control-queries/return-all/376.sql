select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,item i,catalog_returns cr,date_dim d
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_hash >= 388 and cs.cs_hash <= 788 and cd.cd_hash >= 79 and cd.cd_hash <= 829 and d.d_hash >= 342 and d.d_hash <= 675
;

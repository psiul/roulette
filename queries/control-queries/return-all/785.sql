select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer_demographics cd,catalog_returns cr,item i
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_item_sk = i.i_item_sk and d.d_hash >= 254 and d.d_hash <= 587 and cd.cd_hash >= 117 and cd.cd_hash <= 867 and i.i_hash >= 222 and i.i_hash <= 622
;

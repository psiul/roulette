select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,item i,customer_demographics cd,household_demographics hd
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 135 and d.d_hash <= 468 and i.i_hash >= 344 and i.i_hash <= 744 and cd.cd_hash >= 79 and cd.cd_hash <= 829
;

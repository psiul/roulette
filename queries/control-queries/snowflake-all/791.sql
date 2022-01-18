select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,item i,customer_demographics cd,date_dim d
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and i.i_hash >= 499 and i.i_hash <= 832 and cd.cd_hash >= 16 and cd.cd_hash <= 766 and d.d_hash >= 413 and d.d_hash <= 813
;

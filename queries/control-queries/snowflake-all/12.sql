select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,item i,date_dim d,household_demographics hd
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 497 and cd.cd_hash <= 830 and i.i_hash >= 97 and i.i_hash <= 847 and d.d_hash >= 403 and d.d_hash <= 803
;

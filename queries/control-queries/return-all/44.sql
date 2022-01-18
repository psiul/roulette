select count(cs.cs_item_sk)
from catalog_sales cs,item i,customer_demographics cd,household_demographics hd,date_dim d
where cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_hash >= 102 and cs.cs_hash <= 502 and cd.cd_hash >= 143 and cd.cd_hash <= 893 and hd.hd_hash >= 31 and hd.hd_hash <= 364
;

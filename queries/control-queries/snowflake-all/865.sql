select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,item i,date_dim d,customer_demographics cd
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 57 and cs.cs_hash <= 807 and d.d_hash >= 661 and d.d_hash <= 994 and cd.cd_hash >= 271 and cd.cd_hash <= 671
;

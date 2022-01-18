select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer_demographics cd,item i,household_demographics hd
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 213 and cs.cs_hash <= 613 and d.d_hash >= 55 and d.d_hash <= 805 and cd.cd_hash >= 166 and cd.cd_hash <= 499
;

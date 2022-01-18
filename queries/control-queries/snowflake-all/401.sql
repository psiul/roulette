select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,date_dim d,item i,customer_demographics cd
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 89 and hd.hd_hash <= 839 and d.d_hash >= 386 and d.d_hash <= 719 and i.i_hash >= 58 and i.i_hash <= 458
;

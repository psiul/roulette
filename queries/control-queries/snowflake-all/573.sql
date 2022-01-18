select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,date_dim d,item i,customer_demographics cd
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 203 and hd.hd_hash <= 953 and d.d_hash >= 395 and d.d_hash <= 795 and i.i_hash >= 92 and i.i_hash <= 425
;

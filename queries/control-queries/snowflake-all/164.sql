select count(cs.cs_item_sk)
from catalog_sales cs,item i,date_dim d,household_demographics hd,customer_demographics cd
where cs.cs_item_sk = i.i_item_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 94 and i.i_hash <= 844 and d.d_hash >= 592 and d.d_hash <= 925 and hd.hd_hash >= 239 and hd.hd_hash <= 639
;

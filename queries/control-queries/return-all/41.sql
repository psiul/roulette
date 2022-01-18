select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,item i,household_demographics hd,customer_demographics cd
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 175 and cs.cs_hash <= 508 and i.i_hash >= 97 and i.i_hash <= 847 and hd.hd_hash >= 95 and hd.hd_hash <= 495
;

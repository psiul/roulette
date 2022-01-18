select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,date_dim d,customer_demographics cd,item i
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_item_sk = i.i_item_sk and hd.hd_hash >= 211 and hd.hd_hash <= 544 and d.d_hash >= 115 and d.d_hash <= 865 and i.i_hash >= 159 and i.i_hash <= 559
;

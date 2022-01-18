select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,item i,customer_demographics cd,date_dim d
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and i.i_hash >= 192 and i.i_hash <= 525 and cd.cd_hash >= 536 and cd.cd_hash <= 936 and d.d_hash >= 107 and d.d_hash <= 857
;

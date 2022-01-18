select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,customer_demographics cd,item i,date_dim d
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_hash >= 157 and cs.cs_hash <= 490 and cd.cd_hash >= 63 and cd.cd_hash <= 463 and d.d_hash >= 12 and d.d_hash <= 762
;

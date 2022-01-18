select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer_demographics cd,item i,household_demographics hd
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 173 and cs.cs_hash <= 573 and cd.cd_hash >= 58 and cd.cd_hash <= 808 and hd.hd_hash >= 532 and hd.hd_hash <= 865
;

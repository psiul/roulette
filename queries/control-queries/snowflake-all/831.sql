select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,date_dim d,customer_demographics cd,item i
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_item_sk = i.i_item_sk and hd.hd_hash >= 383 and hd.hd_hash <= 783 and cd.cd_hash >= 571 and cd.cd_hash <= 904 and i.i_hash >= 142 and i.i_hash <= 892
;

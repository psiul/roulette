select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,date_dim d,household_demographics hd,item i
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 591 and cs.cs_hash <= 991 and d.d_hash >= 192 and d.d_hash <= 525 and hd.hd_hash >= 129 and hd.hd_hash <= 879
;

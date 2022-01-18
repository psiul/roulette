select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,item i,customer_demographics cd,date_dim d
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and hd.hd_hash >= 183 and hd.hd_hash <= 933 and i.i_hash >= 149 and i.i_hash <= 482 and d.d_hash >= 387 and d.d_hash <= 787
;

select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,item i,date_dim d,household_demographics hd
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 150 and cs.cs_hash <= 550 and i.i_hash >= 36 and i.i_hash <= 786 and d.d_hash >= 536 and d.d_hash <= 869
;

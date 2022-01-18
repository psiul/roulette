select count(cs.cs_item_sk)
from catalog_sales cs,item i,household_demographics hd,customer_demographics cd,customer c
where cs.cs_item_sk = i.i_item_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 416 and cs.cs_hash <= 749 and i.i_hash >= 153 and i.i_hash <= 903 and c.c_hash >= 115 and c.c_hash <= 515
;

select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,item i,household_demographics hd,customer c
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 74 and cs.cs_hash <= 824 and hd.hd_hash >= 345 and hd.hd_hash <= 678 and c.c_hash >= 579 and c.c_hash <= 979
;

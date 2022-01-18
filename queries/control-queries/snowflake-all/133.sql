select count(cs.cs_item_sk)
from catalog_sales cs,customer c,customer_demographics cd,item i,household_demographics hd
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 433 and cs.cs_hash <= 766 and c.c_hash >= 189 and c.c_hash <= 939 and i.i_hash >= 2 and i.i_hash <= 402
;

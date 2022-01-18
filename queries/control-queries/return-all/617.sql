select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,customer c,customer_demographics cd,item i
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 167 and cs.cs_hash <= 567 and c.c_hash >= 494 and c.c_hash <= 827 and i.i_hash >= 247 and i.i_hash <= 997
;

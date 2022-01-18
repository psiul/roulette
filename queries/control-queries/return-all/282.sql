select count(cs.cs_item_sk)
from catalog_sales cs,customer c,household_demographics hd,item i,customer_demographics cd
where cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 202 and cs.cs_hash <= 952 and hd.hd_hash >= 454 and hd.hd_hash <= 854 and i.i_hash >= 68 and i.i_hash <= 401
;

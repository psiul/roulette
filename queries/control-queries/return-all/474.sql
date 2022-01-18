select count(cs.cs_item_sk)
from catalog_sales cs,customer c,household_demographics hd,item i,customer_demographics cd
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 18 and c.c_hash <= 768 and hd.hd_hash >= 624 and hd.hd_hash <= 957 and cd.cd_hash >= 486 and cd.cd_hash <= 886
;

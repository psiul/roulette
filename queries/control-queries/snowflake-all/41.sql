select count(cs.cs_item_sk)
from catalog_sales cs,item i,customer_demographics cd,customer c,household_demographics hd
where cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 89 and cs.cs_hash <= 839 and cd.cd_hash >= 77 and cd.cd_hash <= 477 and c.c_hash >= 521 and c.c_hash <= 854
;

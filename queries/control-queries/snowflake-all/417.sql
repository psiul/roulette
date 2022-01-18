select count(cs.cs_item_sk)
from catalog_sales cs,item i,customer_demographics cd,customer c,household_demographics hd
where cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 28 and cs.cs_hash <= 778 and cd.cd_hash >= 386 and cd.cd_hash <= 786 and c.c_hash >= 455 and c.c_hash <= 788
;

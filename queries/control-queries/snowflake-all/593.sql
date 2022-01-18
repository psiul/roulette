select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,item i,customer c,household_demographics hd
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 384 and cd.cd_hash <= 717 and i.i_hash >= 65 and i.i_hash <= 815 and hd.hd_hash >= 423 and hd.hd_hash <= 823
;

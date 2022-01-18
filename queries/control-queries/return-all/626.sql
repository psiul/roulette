select count(cs.cs_item_sk)
from catalog_sales cs,item i,household_demographics hd,customer c,customer_demographics cd
where cs.cs_item_sk = i.i_item_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 420 and cs.cs_hash <= 753 and c.c_hash >= 301 and c.c_hash <= 701 and cd.cd_hash >= 198 and cd.cd_hash <= 948
;

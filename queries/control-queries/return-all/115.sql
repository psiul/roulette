select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,item i,customer_demographics cd,customer c
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and i.i_hash >= 226 and i.i_hash <= 976 and cd.cd_hash >= 556 and cd.cd_hash <= 956 and c.c_hash >= 334 and c.c_hash <= 667
;

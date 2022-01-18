select count(cs.cs_item_sk)
from catalog_sales cs,customer c,customer_demographics cd,household_demographics hd,item i
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 78 and cs.cs_hash <= 478 and hd.hd_hash >= 500 and hd.hd_hash <= 833 and i.i_hash >= 142 and i.i_hash <= 892
;

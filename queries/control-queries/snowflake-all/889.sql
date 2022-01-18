select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,customer c,household_demographics hd,customer_demographics cd
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 203 and cs.cs_hash <= 953 and c.c_hash >= 281 and c.c_hash <= 681 and hd.hd_hash >= 643 and hd.hd_hash <= 976
;

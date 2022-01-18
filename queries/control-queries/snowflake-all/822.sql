select count(cs.cs_item_sk)
from catalog_sales cs,customer c,household_demographics hd,warehouse w,customer_demographics cd
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 20 and cs.cs_hash <= 770 and c.c_hash >= 395 and c.c_hash <= 795 and hd.hd_hash >= 577 and hd.hd_hash <= 910
;

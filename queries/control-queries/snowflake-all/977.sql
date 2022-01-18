select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,warehouse w,customer c,customer_demographics cd
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 471 and cs.cs_hash <= 804 and hd.hd_hash >= 96 and hd.hd_hash <= 846 and c.c_hash >= 198 and c.c_hash <= 598
;

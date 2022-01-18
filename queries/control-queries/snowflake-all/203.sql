select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,item i,customer_demographics cd,household_demographics hd
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 32 and i.i_hash <= 432 and cd.cd_hash >= 623 and cd.cd_hash <= 956 and hd.hd_hash >= 122 and hd.hd_hash <= 872
;

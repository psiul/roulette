select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,customer_demographics cd,warehouse w,item i
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_item_sk = i.i_item_sk and hd.hd_hash >= 522 and hd.hd_hash <= 855 and cd.cd_hash >= 41 and cd.cd_hash <= 791 and i.i_hash >= 427 and i.i_hash <= 827
;

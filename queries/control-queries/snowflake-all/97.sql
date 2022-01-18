select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,customer_demographics cd,item i,warehouse w
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and hd.hd_hash >= 145 and hd.hd_hash <= 545 and cd.cd_hash >= 512 and cd.cd_hash <= 845 and i.i_hash >= 79 and i.i_hash <= 829
;

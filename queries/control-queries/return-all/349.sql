select count(cs.cs_item_sk)
from catalog_sales cs,item i,household_demographics hd,warehouse w,customer_demographics cd
where cs.cs_item_sk = i.i_item_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 1 and cs.cs_hash <= 751 and i.i_hash >= 518 and i.i_hash <= 918 and hd.hd_hash >= 319 and hd.hd_hash <= 652
;

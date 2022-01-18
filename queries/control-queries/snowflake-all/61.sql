select count(cs.cs_item_sk)
from catalog_sales cs,item i,customer_demographics cd,household_demographics hd,warehouse w
where cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and i.i_hash >= 44 and i.i_hash <= 444 and cd.cd_hash >= 140 and cd.cd_hash <= 890 and hd.hd_hash >= 450 and hd.hd_hash <= 783
;

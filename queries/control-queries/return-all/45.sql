select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,household_demographics hd,customer_demographics cd,warehouse w
where cs.cs_order_number = cr.cr_order_number and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 233 and cs.cs_hash <= 983 and hd.hd_hash >= 430 and hd.hd_hash <= 763 and cd.cd_hash >= 404 and cd.cd_hash <= 804
;

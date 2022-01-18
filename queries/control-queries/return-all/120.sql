select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,catalog_returns cr,warehouse w,item i
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 465 and cs.cs_hash <= 798 and cd.cd_hash >= 453 and cd.cd_hash <= 853 and i.i_hash >= 52 and i.i_hash <= 802
;

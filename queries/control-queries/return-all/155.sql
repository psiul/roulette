select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,customer_demographics cd,household_demographics hd,date_dim d
where cs.cs_order_number = cr.cr_order_number and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cr.cr_refunded_hdemo_sk = hd.hd_demo_sk and cr.cr_returned_date_sk = d.d_date_sk and cd.cd_hash >= 569 and cd.cd_hash <= 969 and hd.hd_hash >= 62 and hd.hd_hash <= 812 and d.d_hash >= 463 and d.d_hash <= 796
;

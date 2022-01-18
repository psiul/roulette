select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,date_dim d,household_demographics hd,customer_demographics cd
where cs.cs_order_number = cr.cr_order_number and cs.cs_sold_date_sk = d.d_date_sk and cr.cr_refunded_hdemo_sk = hd.hd_demo_sk and cr.cr_refunded_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 64 and d.d_hash <= 814 and hd.hd_hash >= 48 and hd.hd_hash <= 381 and cd.cd_hash >= 300 and cd.cd_hash <= 700
;

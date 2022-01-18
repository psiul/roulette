select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,household_demographics hd,customer_demographics cd,date_dim d
where cs.cs_order_number = cr.cr_order_number and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cr.cr_refunded_cdemo_sk = cd.cd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_hash >= 123 and cs.cs_hash <= 873 and hd.hd_hash >= 549 and hd.hd_hash <= 882 and cd.cd_hash >= 539 and cd.cd_hash <= 939
;

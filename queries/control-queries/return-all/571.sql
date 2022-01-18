select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,date_dim d,catalog_returns cr,item i
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_order_number = cr.cr_order_number and cr.cr_item_sk = i.i_item_sk and cs.cs_hash >= 231 and cs.cs_hash <= 631 and cd.cd_hash >= 600 and cd.cd_hash <= 933 and d.d_hash >= 225 and d.d_hash <= 975
;

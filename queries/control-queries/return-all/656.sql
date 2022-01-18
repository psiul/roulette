select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,item i,customer_demographics cd,date_dim d
where cs.cs_order_number = cr.cr_order_number and cr.cr_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cr.cr_returned_date_sk = d.d_date_sk and cs.cs_hash >= 60 and cs.cs_hash <= 810 and i.i_hash >= 303 and i.i_hash <= 703 and d.d_hash >= 629 and d.d_hash <= 962
;

select count(cs.cs_item_sk)
from catalog_sales cs,customer c,item i,customer_demographics cd,date_dim d
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_hash >= 130 and cs.cs_hash <= 880 and i.i_hash >= 275 and i.i_hash <= 675 and cd.cd_hash >= 343 and cd.cd_hash <= 676
;

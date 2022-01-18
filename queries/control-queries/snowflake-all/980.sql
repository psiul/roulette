select count(cs.cs_item_sk)
from catalog_sales cs,item i,customer_demographics cd,date_dim d,household_demographics hd
where cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 118 and i.i_hash <= 518 and cd.cd_hash >= 623 and cd.cd_hash <= 956 and d.d_hash >= 235 and d.d_hash <= 985
;

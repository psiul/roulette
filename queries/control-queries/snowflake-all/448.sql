select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,date_dim d,customer c,item i
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 520 and cs.cs_hash <= 853 and cd.cd_hash >= 24 and cd.cd_hash <= 424 and c.c_hash >= 182 and c.c_hash <= 932
;

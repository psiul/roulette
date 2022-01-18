select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,item i,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 140 and ss.ss_hash <= 890 and d.d_hash >= 578 and d.d_hash <= 978 and cd.cd_hash >= 322 and cd.cd_hash <= 655
;

select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer_demographics cd,customer c,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and d.d_hash >= 66 and d.d_hash <= 399 and hd.hd_hash >= 228 and hd.hd_hash <= 978 and cd.cd_hash >= 479 and cd.cd_hash <= 879
;

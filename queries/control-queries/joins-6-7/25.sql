select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,date_dim d,customer_demographics cd,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 2 and c.c_hash <= 402 and cd.cd_hash >= 429 and cd.cd_hash <= 762 and hd.hd_hash >= 210 and hd.hd_hash <= 960
;

select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,customer_demographics cd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 0 and ss.ss_hash <= 750 and hd.hd_hash >= 222 and hd.hd_hash <= 622 and d.d_hash >= 96 and d.d_hash <= 429
;

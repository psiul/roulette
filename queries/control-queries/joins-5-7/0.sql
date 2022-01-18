select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,date_dim d,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 305 and c.c_hash <= 638 and hd.hd_hash >= 269 and hd.hd_hash <= 669 and d.d_hash >= 177 and d.d_hash <= 927
;

select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 223 and ss.ss_hash <= 973 and d.d_hash >= 170 and d.d_hash <= 570 and cd.cd_hash >= 483 and cd.cd_hash <= 816
;

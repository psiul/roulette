select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 75 and ss.ss_hash <= 825 and c.c_hash >= 455 and c.c_hash <= 788 and hd.hd_hash >= 220 and hd.hd_hash <= 620
;

select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,date_dim d,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 502 and ss.ss_hash <= 835 and d.d_hash >= 211 and d.d_hash <= 961 and hd.hd_hash >= 293 and hd.hd_hash <= 693
;

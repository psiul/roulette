select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 3 and ss.ss_hash <= 203 and cd.cd_hash >= 404 and cd.cd_hash <= 504 and c.c_hash >= 447 and c.c_hash <= 947
;

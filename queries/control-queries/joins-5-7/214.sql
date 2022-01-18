select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 83 and ss.ss_hash <= 416 and cd.cd_hash >= 88 and cd.cd_hash <= 838 and d.d_hash >= 331 and d.d_hash <= 731
;

select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 412 and ss.ss_hash <= 462 and c.c_hash >= 180 and c.c_hash <= 280 and hd.hd_hash >= 310 and hd.hd_hash <= 510
;

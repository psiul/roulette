select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 133 and ss.ss_hash <= 533 and hd.hd_hash >= 237 and hd.hd_hash <= 987 and c.c_hash >= 466 and c.c_hash <= 799
;

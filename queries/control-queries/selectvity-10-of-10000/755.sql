select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,date_dim d,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 627 and ss.ss_hash <= 677 and hd.hd_hash >= 342 and hd.hd_hash <= 542 and c.c_hash >= 817 and c.c_hash <= 917
;

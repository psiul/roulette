select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,date_dim d,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 330 and ss.ss_hash <= 730 and c.c_hash >= 492 and c.c_hash <= 825 and hd.hd_hash >= 221 and hd.hd_hash <= 971
;

select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,date_dim d,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 932 and hd.hd_hash <= 982 and c.c_hash >= 429 and c.c_hash <= 629 and cd.cd_hash >= 598 and cd.cd_hash <= 698
;

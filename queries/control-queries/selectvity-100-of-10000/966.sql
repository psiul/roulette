select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,household_demographics hd,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 538 and ss.ss_hash <= 638 and d.d_hash >= 460 and d.d_hash <= 960 and cd.cd_hash >= 681 and cd.cd_hash <= 881
;

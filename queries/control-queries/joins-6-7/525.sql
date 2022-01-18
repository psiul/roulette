select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,household_demographics hd,customer c,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 81 and d.d_hash <= 831 and c.c_hash >= 537 and c.c_hash <= 870 and cd.cd_hash >= 262 and cd.cd_hash <= 662
;

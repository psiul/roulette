select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,date_dim d,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 624 and hd.hd_hash <= 957 and c.c_hash >= 81 and c.c_hash <= 831 and d.d_hash >= 189 and d.d_hash <= 589
;

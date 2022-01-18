select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,household_demographics hd,customer c,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 39 and d.d_hash <= 789 and hd.hd_hash >= 286 and hd.hd_hash <= 686 and c.c_hash >= 581 and c.c_hash <= 914
;

select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c,household_demographics hd,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 21 and ss.ss_hash <= 771 and i.i_hash >= 266 and i.i_hash <= 599 and c.c_hash >= 44 and c.c_hash <= 444
;

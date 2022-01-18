select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_demographics cd,household_demographics hd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 196 and ss.ss_hash <= 946 and d.d_hash >= 266 and d.d_hash <= 666 and i.i_hash >= 460 and i.i_hash <= 793
;

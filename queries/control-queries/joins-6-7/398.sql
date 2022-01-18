select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i,date_dim d,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 203 and ss.ss_hash <= 953 and c.c_hash >= 512 and c.c_hash <= 845 and i.i_hash >= 217 and i.i_hash <= 617
;

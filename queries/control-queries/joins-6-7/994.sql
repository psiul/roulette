select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,household_demographics hd,item i,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 651 and ss.ss_hash <= 984 and d.d_hash >= 33 and d.d_hash <= 783 and cd.cd_hash >= 18 and cd.cd_hash <= 418
;

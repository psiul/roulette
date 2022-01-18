select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd,date_dim d,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 52 and c.c_hash <= 802 and d.d_hash >= 386 and d.d_hash <= 719 and cd.cd_hash >= 191 and cd.cd_hash <= 591
;

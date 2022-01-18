select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,date_dim d,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 474 and ss.ss_hash <= 874 and c.c_hash >= 573 and c.c_hash <= 906 and cd.cd_hash >= 233 and cd.cd_hash <= 983
;

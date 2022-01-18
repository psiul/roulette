select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,date_dim d,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 225 and i.i_hash <= 975 and c.c_hash >= 138 and c.c_hash <= 471 and cd.cd_hash >= 191 and cd.cd_hash <= 591
;

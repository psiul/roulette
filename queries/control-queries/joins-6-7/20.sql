select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,item i,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and cd.cd_hash >= 393 and cd.cd_hash <= 726 and i.i_hash >= 10 and i.i_hash <= 760 and d.d_hash >= 166 and d.d_hash <= 566
;

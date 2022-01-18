select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd,date_dim d,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 152 and ss.ss_hash <= 485 and c.c_hash >= 524 and c.c_hash <= 924 and cd.cd_hash >= 245 and cd.cd_hash <= 995
;
